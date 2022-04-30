# frozen_string_literal: true

class Web::Posts::LikesController < Web::Posts::ApplicationController
  def create
    resource_post
    @like = current_user.post_likes.new({ post_id: @resource_post.id })

    @like.save

    redirect_to @like.post
  end

  def destroy
    @like = current_user.post_likes.find(params[:id])
    post = @like.post
    @like.destroy

    redirect_to post
  end
end
