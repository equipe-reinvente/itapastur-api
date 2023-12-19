module Users
  module Interactors
    class Update
      include Interactor

      delegate :user_id, :user_params, to: :context
      def call
        user = User.find(user_id)
        
        if user.update(user_params)
          context.user = user
        else
          context.fail!(message: "update_user_error!")
        end
      end
    end
  end
end