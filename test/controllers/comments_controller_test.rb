# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    @post = @comment.post
    @user = users(:one)
    sign_in @user
    @comment_params = {
      content: Faker::Lorem.sentence
    }
  end

  test 'should create comment' do
    params = { comment: @comment_params }
    post post_comments_url(@post), params: params

    comment = Comment.find_by! @comment_params

    assert_redirected_to post_url(@post)
    assert { comment }
  end
end
