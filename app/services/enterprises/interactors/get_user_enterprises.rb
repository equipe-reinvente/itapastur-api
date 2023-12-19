module Enterprises
  module Interactors
    class GetUser
      include Interactor

      delegate :user, to: :context
      def call

        if enterprises = Enterprise.where(user_id: user.id)
          user_enterprises = []

          enterprises.each do |enterprise|
            user_enterprises.push(enterprise.id)
          end

          context.user_enterprises = user_enterprises
        else
          context.fail!(message: "get_user_enterprises_failure")
        end

      end
    end
  end
end