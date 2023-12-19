module Tokens
  module Interactors
    class Decode
      include Interactor

      SECRET_KEY = 'p&qpfv8RKPxkM6D2'

      delegate :auth_header, to: :context
      def call
        if auth_header
          token = auth_header.split(' ').last
          begin
              decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
              context.decoded = decoded
          rescue JWT::DecodeError
              nil
          end
        else
          context.fail!(message: "decode_token_failure")
        end
      end
    end
  end
end
