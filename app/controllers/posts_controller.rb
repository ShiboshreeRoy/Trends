# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :repost]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params.merge(user: current_user))
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def repost
      @original_post = Post.find(params[:id])
      @post = current_user.posts.build(body: @original_post.body, original_post: @original_post)
      if @post.save
        redirect_to @post, notice: 'Post was successfully reposted.'
      else
        redirect_to @original_post, alert: 'Error reposting the post.'
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:body,:file,:original_post_id)
    end
  end