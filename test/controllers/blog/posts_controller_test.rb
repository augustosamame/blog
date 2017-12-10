require 'test_helper'

module Blog
  class PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @post = blog_posts(:one)
    end

    test "should get index" do
      get posts_url
      assert_response :success
    end

    test "should get new" do
      get new_post_url
      assert_response :success
    end

    test "should create post" do
      assert_difference('Post.count') do
        post posts_url, params: { post: { author: @post.author, body: @post.body, numComments: @post.numComments, post_image: @post.post_image, post_public: @post.post_public, post_published: @post.post_published, post_type: @post.post_type, publication_date: @post.publication_date, status: @post.status, title: @post.title, user_id: @post.user_id } }
      end

      assert_redirected_to post_url(Post.last)
    end

    test "should show post" do
      get post_url(@post)
      assert_response :success
    end

    test "should get edit" do
      get edit_post_url(@post)
      assert_response :success
    end

    test "should update post" do
      patch post_url(@post), params: { post: { author: @post.author, body: @post.body, numComments: @post.numComments, post_image: @post.post_image, post_public: @post.post_public, post_published: @post.post_published, post_type: @post.post_type, publication_date: @post.publication_date, status: @post.status, title: @post.title, user_id: @post.user_id } }
      assert_redirected_to post_url(@post)
    end

    test "should destroy post" do
      assert_difference('Post.count', -1) do
        delete post_url(@post)
      end

      assert_redirected_to posts_url
    end
  end
end
