class UsersController < ApplicationController
    before_action :authorize, only: [:view_user, :update, :destroy]

    def create
        result = Users::Organizers::Create.call(user_params: user_params)

        if result.success?
            render json: {token: result.token, user: result.user}
        else
            render json: result.message
        end
    end

    def update
        result = Users::Interactors::Update.call(user_id: params[:user_id], user_params: user_params)

        if result.success?
            render json: result.user
        else
            render json: result.message
        end
    end

    def destroy
        result = Users::Interactors::Destroy.call(user_id: params[:user_id])
        render json: result.message
    end

    def login
        result = Users::Organizers::Login.call(email: params[:email], password: params[:password])
        if result.success?
            render json: {user: result.user,
                          token: result.token,
                          avatar: result.user.avatar.url,
                          enterprises: result.user_enterprises,
                          liked_enterprises: result.liked_enterprises},
            status: :ok
        else
            render json: result.message
        end
    end

    def view_user
        user = User.find(params[:user_id])
        result = Users::Organizers::ViewUser.call(user: user)

        if result.success?
            render json: {
                user: user,
                avatar: user.avatar.url,
                enterprises: result.user_enterprises,
                liked_enterprises: result.liked_enterprises,
            },
            status: :ok
        else
            render json: {error: "Usuário não encontrado!"},
            status: :not_found
        end
    end

    private

    def user_params
        params.permit(:email,:password, :name, :is_turist, :avatar)
    end
end
