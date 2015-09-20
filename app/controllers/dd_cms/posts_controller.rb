module DdCms
  class PostsController < ApplicationController
    def index
      @posts = Post.recent.page params[:page]
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new post_params
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    def show
      @post = Post.find params[:id]
    end

    def edit
      @post = Post.find params[:id]
    end

    def update
      @post = Post.find params[:id]
      if @post.update_attributes post_params
        redirect_to posts_path
      else
        render :edit
      end
    end

    def destroy
      @post = Post.find params[:id]
      @post.destroy
      redirect_to posts_path
    end

    private
    def post_params
      params.require(:post).permit(:title, :slug, :content_body, :category_id)
    end
  end
end
