class FavoritesController < ApplicationController
    before_action :authorize

    def like
        @enterprise = Enterprise.find(params[:enterprise_id])
        @user = User.find(params[:user_id])
        @favorite = Favorite.new()
        @favorite.user = @user
        @favorite.enterprise = @enterprise

        if @favorite.save
            render json: {favorite: @favorite}, status: :ok
        else
            render json: {error: "Usuário ou Empreendimento não encontrados!"}, status: :not_found
        end
    end

end
