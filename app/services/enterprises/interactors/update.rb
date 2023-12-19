module Enterprises
  module Interactors
    class Update
      include Interactor

      delegate :enterprise_id, :enterprise_params, :address_params, to: :context
      def call
        enterprise = Enterprise.find(enterprise_id)
        address = enterprise.address
        if enterprise.update!(enterprise_params) && address.update!(address_params)
          context.enterprise = enterprise
        else
          context.fail!(message: "update_enterprise_failure")
        end
      end
    end
  end
end





