require_dependency "blog/application_controller"

module Blog
  class BlogController < ApplicationController

    skip_before_action :authenticate_user!

    def main
      @tags = Post.tag_counts_on(:tags)
      if params[:tag]
        @posts = Post.where(post_published: true).tagged_with(params[:tag]).order(publication_date: :desc)
      else
        @posts = Post.where(post_published: true).order(publication_date: :desc)
      end
    end

    def show
      @tags = Post.where(post_published: true).tag_counts_on(:tags)
      @sidebar_posts = Post.where(post_published: true) #to be able to show sidebar posts info
      @post = Post.friendly.find(params[:id])
      set_meta_tags og: {
        title:    @post.title.titleize,
        type:     'article',
        image:    [{
          _: @post.post_image.url,
          width: 760,
          height: 360,
        }]
      }
      @title = @post.title.titleize
      #authorize! :show, @post
      response_from_fb_url_object = JSON.parse(Net::HTTP.get("graph.facebook.com", "/#{request.original_url}") )
      if response_from_fb_url_object
          if response_from_fb_url_object["share"]
            @comment_count = response_from_fb_url_object["share"]["comment_count"].blank? ? 0 : response_from_fb_url_object["share"]["comment_count"]
          else
            @comment_count = 0
          end
      else
        @comment_count = 0
      end
      @post.numComments = @comment_count unless @comment_count == 0
      @post.save unless @comment_count == 0
    end

  end
end
