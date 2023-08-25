class UsersController < ApplicationController
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
            render json: {user: @user, token: token},
            status: :ok
        else
            render json: {error: "Usuário ou senha invalidos"},
            status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email,:password)
    end
end
