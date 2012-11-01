module Authentication

  # Expects #session and #find_current_user to be exist.

  class Unauthenticated < StandardError; end

  # Store user id in session.
  #
  def login!(user)
    raise Unauthenticated unless user
    @current_user = user
    session[:current_user_id] = user.id
  end

  # Return current_user.
  # If it does not exist, returns nil.
  #
  # @return user or nil
  def current_user
    @current_user ||= find_current_user
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
