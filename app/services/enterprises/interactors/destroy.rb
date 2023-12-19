module Enterprises
  module Interactors
    class Destroy
      include Interactor

      delegate :enterprise_id, to: :context
      def call
        enterprise = Enterprise.find(enterprise_id)
        if enterprise.destroy!
          context.message(message: "Empresa deletada!")
        else
          context.fail!(message: "get_liked_enterprises_failure")
        end
      end
    end
  end
end





