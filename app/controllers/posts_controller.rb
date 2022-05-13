# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.arrange
    @like = current_user.likes.find_by(post_id: @post) if user_signed_in?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id).merge(user_id: current_user.id)
  end
end
