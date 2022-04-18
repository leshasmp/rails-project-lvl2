# frozen_string_literal: true

class Web::Posts::CommentsController < Web::Posts::ApplicationController
  def create
    resource_post
    @comment = @resource_post.post_comments.build(comment_params)

    if @comment.save
      redirect_to @resource_post, notice: t('.success')
    else
      redirect_to @resource_post
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:content, :email, :parent_id)
  end
end
