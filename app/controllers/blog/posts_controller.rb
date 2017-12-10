require_dependency "blog/application_controller"

module Blog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

    # GET /posts

    def index
      @title = "Artículos"
      #@tags = Post.published(true).tag_counts_on(:tags)
      #@sidebar_posts = Post.published(true).all
      if params[:tag]
        @posts = Post.where(post_published: true).tagged_with(params[:tag]).order(publication_date: :desc)
      else
        if params[:author]
          @posts = Post.where(post_published: true, user: params[:author]).order(publication_date: :desc)
        else
          @posts = Post.where(post_published: true).order(publication_date: :desc)
        end
      end

    end

    def show
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :post_image, :body, :user_id, :status, :post_type, :post_public, :post_published, :numComments, :publication_date, :author, :tag_list)
      end
  end
end
