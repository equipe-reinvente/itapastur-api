module Comments
  module Interactors
    class Destroy
      include Interactor

      delegate :comment_id, to: :context

      def call
        comment = Comment.find(comment_id)
        if comment.destroy!
          context.message = "Comentário deletado!"
        else
          context.fail!(message: "create_comment_failure")
        end
      end
    end 
  end 
end