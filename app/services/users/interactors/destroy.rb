module Users
  module Interactors
    class Destroy
      include Interactor

      delegate :user_id, to: :context
      def call
        user = User.find(user_id)
        
        if user.destroy!
          context.message = "Usuário deletado!"
        else
          context.fail!(message: "update_user_error!")
        end
      end
    end
  end
end