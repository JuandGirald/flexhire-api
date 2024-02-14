class AuthorizeApiRequest
    prepend SimpleCommand
  
    def initialize(headers = {})
      @headers = headers
    end

    def call
        {
          api_key: http_auth_header
        }
    end

    private

    attr_reader :headers
        # check for token in `FLEXHIRE-API-KEY` header
        def http_auth_header
            return headers['FLEXHIRE-API-KEY'] unless headers['FLEXHIRE-API-KEY'].blank?
            errors.add :user_authentication, Message.missing_api_key
        end
end