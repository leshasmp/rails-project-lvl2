# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should create like' do
    post post_likes_url(@post)
    post = PostLike.find_by(user_id: @user)

    assert_redirected_to post_url(@post)
    assert { post }
  end
end
