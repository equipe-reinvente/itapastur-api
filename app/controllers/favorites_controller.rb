class FavoritesController < ApplicationController
    before_action :authorize

    def like
        @enterprise = Enterprise.find(params[:enterprise_id])
        @user = User.find(params[:user_id])
        @favorite = Favorite.find_by(user: @user, enterprise: @enterprise)

        if @favorite
            @favorite.destroy
            render json: {message: "Unfavorited"}, status: :ok
        else
            @favorite = Favorite.new(user: @user, enterprise: @enterprise)
            
            if @favorite.save
                render json: {favorite: @favorite}, status: :ok
            else
                render json: {error: "Usuário ou Empreendimento não encontrados!"}, status: :not_found
            end
        end
    end
end
