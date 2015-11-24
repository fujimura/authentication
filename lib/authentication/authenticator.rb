module Authentication
  # A object to authenticate client.
  # @since 0.0.2
  class Authenticator
    # @param [Hash] options the options to create a authenticator with.
    # @option options [Hash] :session Hash-like session object.
    # @option options [Symbol] :session_key Key of session_id.
    # @option options [Proc] :finder A proc which returns client to authenticate.
    def initialize(options)
      @session = options.fetch :session
      @session_key = options.fetch :session_key
      @finder = options.fetch :finder
    end

    # Set current_client.
    #
    # @raise [Unauthenticated] Raised when given client doesn't exist.
    def login!(client)
      raise Unauthenticated unless client
      @current_client = client
      @session[@session_key] = client.id
    end

    # Return current_client.
    # If it does not exist, returns nil.
    #
    # @return [Object] The object stored as client or nil
    def current_client
      @current_client ||= @finder.call
    end
    alias current_user current_client

    # Return id of given current_client.
    # If it does not exist, returns nil.
    #
    # @return [Object] The id of object stored as client or nil
    def current_client_id
      @session[@session_key]
    end
    alias current_user_id current_client_id

    # Return current_client exists or not.
    #
    # @return [Boolean]
    def logged_in?
      not current_client.nil?
    end

    # Delete current_client from database and session.
    #
    def logout!
      return unless current_client
      @current_client = @session[@session_key] = nil
    end
  end
end
