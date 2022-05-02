# frozen_string_literal: true

class Web::HomeController < Web::ApplicationController
  def index
    @posts = Post.includes(:creator).page params[:page]
  end
end
