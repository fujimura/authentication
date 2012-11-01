require "authentication/version"

module Authentication

  class Unauthenticated < StandardError; end

  # Log in with given object.
  #
  # @param [Object] user The object you want to store as `current_user`.
  def login!(user)
    raise Unauthenticated unless user
    @current_user = user
    session[:current_user_id] = user.id
  end

  # Return current_user.
  # If it does not exist, returns nil.
  #
  # @return [Object] The object stored as user or nil
  def current_user
    @current_user ||= find_current_user
  end

  # Return id of given current_user.
  # If it does not exist, returns nil.
  #
  # @return [Object] The id of object stored as user or nil
  def current_user_id
    session[:current_user_id]
  end

  # Return current_user exists or not.
  #
  # @return [Boolean]
  def logged_in?
    not current_user.nil?
  end

  # Delete current_user from database and session.
  #
  def logout!
    return unless current_user
    @current_user = session[:current_user_id] = nil
  end
end
