require "authentication/version"
require "authentication/authenticator"

# Top-level namespace of this library, also works as a convenient module to supply authentication-related methods for Rails controller etc.
#
# By including this, the class will have methods like "login!" or "current_user!". See method list for the documentation of Authenticator.
#
# To find current_user, this module uses "find_current_user" method defined in included module to find current user, and "current_user_id" as the session key.
module Authentication
  # Raised when authentication was failed.
  class Unauthenticated < StandardError; end

  def self.included(base)
    base.class_eval do
      extend Forwardable
      def_delegators :current_user_authenticator, :login!, :current_user, :current_user_id, :logged_in?, :logout!
    end
  end

  # Return authenticator for current_user.
  #
  # @return [Authentication::Authenticator]
  def current_user_authenticator
    @__authenticator ||= Authentication::Authenticator.new(
      session: session,
      session_key: :current_user_id,
      finder: -> { find_current_user },
      after_login_callback: -> { self.respond_to?(:after_login, true) && after_login },
      after_logout_callback: -> { self.respond_to?(:after_logout, true) && after_logout }
    )
  end
end
