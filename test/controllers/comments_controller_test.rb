# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @comment_params = {
      content: Faker::Lorem.sentence,
      email: Faker::Internet.email
    }
  end

  test 'should create comment' do
    params = { post_comment: @comment_params }
    post post_comments_url(@post), params: params

    comment = PostComment.find_by! @comment_params

    assert_redirected_to post_url(@post)
    assert { comment }
  end
end
