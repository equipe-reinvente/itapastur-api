module Enterprises
  module Interactors
    class Create
      include Interactor

      delegate :enterprise_params, :address, to: :context

      def call
        enterprise = Enterprise.new(enterprise_params)
        enterprise.address = address
        if enterprise.save!
          context.enterprise = enterprise
        else
          context.fail!(message: "create_enterprise_failure")
        end
      end
    end
  end
end