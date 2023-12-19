module Categories
  module Interactors
    class Create
      include Interactor

      delegate :category_params, to: :context
      def call
        if category = Category.create!(category_params)
          context.category = category
        else
          context.fail!(message: "create_category_failure")
        end
      end
    end
  end
end