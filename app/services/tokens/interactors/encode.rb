module Tokens
  module Interactors
    class Encode
      include Interactor

      SECRET_KEY = 'p&qpfv8RKPxkM6D2'

      delegate :user, to: :context
      def call
        token = JWT.encode({user_id: user.id}, SECRET_KEY)

        context.token = token
      end
    end
  end
end