module Comments
  module Interactors
    class GetEnterprise
      include Interactor

      delegate :enterprise_id, to: :context

      def call
        if comments = Comments.where(enterprise_id: enterprise_id)
          enterprise_comments = []
          comments.each do |comment|
            comment_data = {
                id: comment.id,
                text_content: comment.text_content,
                enterprise_id: comment.enterprise_id,
                user_id: comment.user_id,
                user_name: comment.user.name,
                user_avatar: comment.user.avatar.url
            }
            enterprise_comments << comment_data
          end
          context.enterprise_comments = enterprise_comments
        else
          context.enterprise_comments = []
        end
      end
    end 
  end 
end