class FavoritesController < ApplicationController
    before_action :authorize

    def user_likes
        result = Favorites::Interactors::GetUser.call(user_id: params[:user_id])
        if result.success?
            render json: result.favorites
        else
            render json: result.message
        end
    end

    def like
        result = Favorites::Interactors::HandleLike.call(enterprise_id: params[:enterprise_id], user_id: user_id)

        render json: result.message
    end
end
