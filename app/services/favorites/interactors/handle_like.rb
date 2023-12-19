module Favorites
  module Interactors
    class HandleLike
      include Interactor

      delegate :enterprise_id, :user_id, to: :context 
      def call
        if favorite = Favorite.find_by(enterprise_id: enterprise_id, user_id: user_id)
          favorite.destroy!
          context.message = "Unliked"
        else
          if favorite = Favorite.create!(enterprise_id: enterprise_id, user_id: user_id)
            context.message = "Liked"
          else
            context.message = "Usuário ou Empreendimento não encontrados!"
          end
        end
      end
    end
  end
end 