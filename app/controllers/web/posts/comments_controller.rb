# frozen_string_literal: true

class Web::Posts::CommentsController < Web::Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @comment = resource_post.comments.build(comment_params)

    if @comment.save
      redirect_to resource_post, notice: t('.success')
    else
      redirect_to resource_post, flash: { error: t('.error') }
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id).merge(user_id: current_user.id)
  end
end
