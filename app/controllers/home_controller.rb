# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.includes(:creator).page params[:page]
  end
end
