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
        result = Comments::Interactors::Update.call(comment_id: params[:comment_id], text_content: params[:text_content])

        if result.success?
            render json: context.comment
        else
            render json: context.message
        end
    end

    def destroy_comment
        result = Comments::Interactors::Destroy.call(comment_id: params[:comment_id])
        render json: result.message
    end

    private

    def comments_params
        params.permit(:text_content, :user_id, :enterprise_id)
    end
end
