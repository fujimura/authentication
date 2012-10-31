module Authentication

  class CurrentUserDoesNotExist < StandardError ; end
  class Unauthenticated < StandardError; end

  extend ActiveSupport::Concern

  included do |base|
    base.class_eval do
      helper_method :current_user
    end
  end

  # Store user id in session.
  #
  def login!(user)
    raise Unauthenticated unless user
    session[:current_user_id] = user.id
  end

  # Return current_user.
  # If it does not exist, returns nil.
  #
  # @return user or nil
  def current_user
    @current_user ||= ::User.find(session[:current_user_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  # Return current_user exists or not.
  #
  # @return [Boolean] Whether or not page's plan is updated.
  def logged_in?
    !current_user.blank?
  end

  # Delete current_user from database and session.
  #
  def logout!
    return unless current_user
    @current_user = session[:current_user_id] = nil
  end
end
