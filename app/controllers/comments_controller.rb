class CommentsController < ApplicationController

    before_action :authorize
    def create
        @enterprise = Enterprise.find(params[:enterprise_id])
        @user = User.find(params[:user_id])
        @comment = Comment.new(comments_params)
        @comment.user = @user
        @comment.enterprise = @enterprise

        if @comment.save
            render json: {comment: @comment}, status: :ok
        else
            render json: {error: "Empresa ou usuário não encontrados!"}, status: :not_found
        end
    end
    
    private

    def comments_params
        params.permit(:text_content)
    end
end
