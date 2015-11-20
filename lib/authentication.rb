require "authentication/version"
require "authentication/authenticator"

module Authentication
  class Unauthenticated < StandardError; end

  def self.included(base)
    base.class_eval do
      extend Forwardable
      def_delegators :authenticator, :login!, :current_user, :current_user_id, :logged_in?, :logout!
    end
  end

  def authenticator
    @__authenticator ||= Authentication::Authenticator.new(
      session: session,
      session_key: :current_user_id,
      finder: -> { find_current_user }
    )
  end
end
