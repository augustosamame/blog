require 'test_helper'

module Blog
  class BlogControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get main" do
      get blog_main_url
      assert_response :success
    end

  end
end
