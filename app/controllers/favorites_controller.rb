class FavoritesController < ApplicationController
    before_action :authorize

    def user_likes
        @user = User.find(params[:user_id])
        @favorites = Favorite.find_by(user: @user)

        if @favorites
            render json: {favorites: @favorites}, status: :ok
        else
            render json: {message: "O usuário não curtiu empreendimento algum! :("}, status: :not_found
        end
    end

    def like
        result = Favorites::Interactors::HandleLike.call(enterprise_id: params[:enterprise_id], user_id: user_id)

        render json: result.message
    end
end
