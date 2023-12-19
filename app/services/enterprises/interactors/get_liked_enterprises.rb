module Enterprises
  module Interactors
    class GetLikedEnterprises
      include Interactor

      delegate :user, to: :context
      def call

        if liked_enterprises = Favorite.where(user_id: user.id)
          liked = []

          liked_enterprises.each do |enterprise|
            liked.push(enterprise.enterprise_id)
          end

          context.liked_enterprises = liked
        else
          context.fail!(message: "get_liked_enterprises_failure")
        end

      end
    end
  end
end





