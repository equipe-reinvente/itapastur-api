class CommentsController < ApplicationController
    before_action :authorize

    def get_enterprise_comments
        result = Comments::Interactors::GetEnterprise.call(enterprise_id: params['enterprise_id'])
        
        render json: {comments: result.enterprise_comments}, status: :ok
    end

    def create
        result = Comments::Interactors::Create.call(comment_params: comment_params)

        if result.success?
            render json: result.comment
        else
            render json: result.message
        end
    end
    
    def edit_comment
        @comment = Comment.find(params[:comment_id])

        if @comment.update(text_content: params[:text_content])
            render json: {comment: @comment}
        else
            render json: {error: "Erro ao alterar o comentário!"}, status: :unprocessable_entity
        end
    end

    def destroy_comment
        @comment = Comment.find(params[:comment_id])

        if @comment.destroy
            render json: {message: "Comentário deletado!"}, status: :ok
        else
            render json: {error: "Erro ao deletar comentário!"}, status: :unprocessable_entity
        end
    end

    private

    def comments_params
        params.permit(:text_content, :user_id, :enterprise_id)
    end
end
