module Favorites
  module Interactors
    class GetUser
      include Interactor

      delegate :user_id, to: :context 
      def call
        if favorites = Favorite.where(user_id: user_id)
          context.favorites = favorites
        else
          context.fail!(message: "get_user_likes_failure")
        end
      end
    end
  end
end 