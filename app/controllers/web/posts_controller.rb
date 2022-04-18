# frozen_string_literal: true

class Web::PostsController < Web::ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @user = User.find @post.creator
    @comments = PostComment.where(ancestry: nil).all
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
    params.require(:post).permit(:title, :body, :creator, :post_category_id)
  end
end
