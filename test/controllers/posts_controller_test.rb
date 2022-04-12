# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @post_category = post_categories(:one)
    @post = posts(:one)
    sign_in @user
    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote,
      post_category_id: @post_category.id,
      user_id: @user.id
    }
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: { post: @attrs }

    post = Post.find_by! title: @attrs[:title]

    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
