# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote,
      category_id: @category.id
    }
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: { post: @attrs }

    post = Post.where(title: @attrs[:title]).take

    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get posts_url(@post)
    assert_response :success
  end
end
