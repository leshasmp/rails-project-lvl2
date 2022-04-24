# frozen_string_literal: true

class Web::Posts::CommentsController < Web::Posts::ApplicationController
  def create
    resource_post
    @comment = @resource_post.post_comments.build(comment_params)

    if @comment.save
      redirect_to @resource_post, notice: t('.success')
    else
      redirect_to @resource_post, notice: t('.error')
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id).merge(email: current_user.email)
  end
end
