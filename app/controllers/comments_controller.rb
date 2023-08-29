class CommentsController < ApplicationController

    before_action :authorize

    def get_enterprise_comments
        comments = Comment.where(enterprise_id: params[:enterprise_id])
        enterprise_comments = []
        comments.each do |comment|
            comment_data = {
                id: comment.id,
                text_content: comment.text_content,
                enterprise_id: comment.enterprise_id,
                user_id: comment.user_id,
                user_name: comment.user.name
            }
            enterprise_comments << comment_data
        end
        
        render json: {comments: enterprise_comments}, status: :ok
    end

    def create
        @comment = Comment.new(comments_params)

        if @comment.save
            render json: {comment: @comment}, status: :ok
        else
            render json: {error: "Empresa ou usuário não encontrados!"}, status: :not_found
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
