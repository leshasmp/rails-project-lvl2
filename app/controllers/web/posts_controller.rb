# frozen_string_literal: true

class Web::PostsController < Web::ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @user = User.find @post.user_id
    @comments = PostComment.where(ancestry: nil).all
    @likes = PostLike.where(post_id: @post.id).all
  end

  def new
    @post = Post.new
    redirect_to root_path, notice: t('devise.failure.user.unauthenticated') unless user_signed_in?
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
    params.require(:post).permit(:title, :body, :post_category_id).merge(user_id: current_user.id)
  end
end
