# frozen_string_literal: true

class Web::Posts::LikesController < Web::Posts::ApplicationController
  before_action :authenticate_user!

  def create
    resource_post
    @like = current_user.likes.new({ post_id: @resource_post.id })
    @like.save

    redirect_to @like.post
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy

    redirect_to post
  end
end
