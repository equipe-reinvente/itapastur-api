class ApplicationController < ActionController::API
    SECRET_KEY = 'p&qpfv8RKPxkM6D2'

    def authorize

        result = Tokens::Organizers::Authorize.call(auth_header: request.headers['Authorization'])
        
        if result.fail?
            render json: {message: "Você precisa estar logado!"}, status: :unauthorized
        end
    end
end
