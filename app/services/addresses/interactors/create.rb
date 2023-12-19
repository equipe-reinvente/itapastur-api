module Addresses
  module Interactors
    class Create
      include Interactor

      delegate :address_params, to: :context

      def call
        if address = Address.create!(address_params)
          context.address = address
        else
          context.fail!(message: "create_address_failure")
        end
      end
    end
  end
end