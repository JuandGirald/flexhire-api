class ApplicationController < ActionController::API
    private
        def api_key
            auth = AuthorizeApiRequest.call(request.headers)
            return auth.result[:api_key] if auth.success?
            nil
        end
    
end
