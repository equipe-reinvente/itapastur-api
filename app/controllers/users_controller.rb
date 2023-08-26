class UsersController < ApplicationController
    before_action :authorize, only: [:view_user]

    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token},
            status: :ok
        else
            render json: {error: "Usuário ou senha invalidos"},
            status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            enterprises = Enterprise.where(user_id: @user.id)
            liked_enterprises = Favorite.where(user_id: @user.id)
            liked = []
            user_enterprises = []
            enterprises.each do |enterprise|
                user_enterprises.push(enterprise.id)
            end
            liked_enterprises.each do |enterprise|
                liked.push(enterprise.enterprise_id)
            end

            render json: {user: @user,
                          token: token,
                          enterprises: user_enterprises,
                          liked_enterprises: liked},
            status: :ok
        else
            render json: {error: "Usuário ou senha invalidos"},
            status: :unprocessable_entity
        end
    end

    def view_user
        @user = User.find(params[:user_id])
        enterprises = Enterprise.where(user_id: @user.id)
        liked_enterprises = Favorite.where(user_id: @user.id)
        liked = []
        user_enterprises = []
        enterprises.each do |enterprise|
            user_enterprises.push(enterprise.id)
        end
        liked_enterprises.each do |enterprise|
            liked.push(enterprise.enterprise_id)
        end
        if @user
            render json: {
                user: @user,
                enterprises: user_enterprises,
                liked_enterprises: liked,
            },
            status: :ok
        else
            render json: {error: "Usuário não encontrado!"},
            status: :not_found
        end
    end

    private

    def user_params
        params.require(:user).permit(:email,:password, :name)
    end
end
