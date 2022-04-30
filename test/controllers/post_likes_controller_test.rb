# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should create post' do
    post post_likes_url(@post)

    post = Like.where(user_id: @user).take

    assert_redirected_to post_url(@post)
    assert { post }
  end
end
