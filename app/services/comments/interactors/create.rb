module Comments
  module Interactors
    class Create
      include Interactor

      delegate :comment_params, to: :context

      def call
        if comment = Comment.create!(comment_params)
          context.comment = comment
        else
          context.fail!(message: "create_comment_failure")
        end
      end
    end 
  end 
end