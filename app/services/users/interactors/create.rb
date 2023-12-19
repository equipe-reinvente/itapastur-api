module Users
  module Interactors
    class Create
      include Interactor

      delegate :user_params, to: :context

      def call
        if user = User.create!(user_params)
          context.user = user
        else
          context.fail!(message: "create_user_failure")
        end
      end
    end
  end
end















