module Users
  module Interactors
    class Authenticate
      include Interactor

      delegate :email, :password, to: :context

      def call
        user = User.find_by(email: email)
        if user && user.authenticate(password)
          context.user = user
        else
          context.fail!(message: "authenticate_user_failure")
        end
      end
    end
  end
end













