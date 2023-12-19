module Tokens
  module Interactors
    class AuthorizedUser
      include Interactor

      delegate :decoded, to: :context

      def call
        if user = User.find(decoded[0]['user_id'])
          context.user = user
        else
          context.fail!(message: "authorized_user_failure")
        end
      end
    end
  end
end
