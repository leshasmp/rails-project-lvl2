# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.new(post_id: resource_post.id)
    @like.save

    redirect_to @like.post
  end

  def destroy
    @like = current_user.likes.find_by(post_id: resource_post.id)

    @like&.destroy

    redirect_to resource_post
  end
end
