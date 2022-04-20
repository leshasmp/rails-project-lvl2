# frozen_string_literal: true

class Web::Posts::LikesController < Web::Posts::ApplicationController
  def create
    resource_post
    @like = @resource_post.post_likes.build(user_id: current_user.id)

    @like.save

    redirect_to @resource_post
  end

  def destroy
    resource_post
    @like = PostLike.where(user_id: current_user.id).take

    @like.destroy

    redirect_to @resource_post
  end
end