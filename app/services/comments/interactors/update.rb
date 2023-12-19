module Comments
  module Interactors
    class Update
      include Interactor

      delegate :comment_id, :text_content, to: :context

      def call
        if comment = Comment.update!(text_content: text_content)
          context.comment = comment
        else
          context.fail!(message: "update_comment_failure")
        end
      end
    end 
  end 
end