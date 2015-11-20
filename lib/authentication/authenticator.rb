module Authentication
  class Authenticator
    def initialize(options)
      @session = options.fetch :session
      @session_key = options.fetch :session_key
      @finder = options.fetch :finder
    end

    def login!(user)
      raise Unauthenticated unless user
      @current_user = user
      @session[@session_key] = user.id
    end

    # Return current_user.
    # If it does not exist, returns nil.
    #
    # @return [Object] The object stored as user or nil
    def current_user
      @current_user ||= @finder.call
    end

    # Return id of given current_user.
    # If it does not exist, returns nil.
    #
    # @return [Object] The id of object stored as user or nil
    def current_user_id
      @session[@session_key]
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
      @current_user = @session[@session_key] = nil
    end
  end
end
