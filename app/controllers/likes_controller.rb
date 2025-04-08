# app/controllers/likes_controller.rb
class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(user: current_user)
      if @like.save
        redirect_to @post, notice: 'Post liked.'
      else
        redirect_to @post, alert: 'Unable to like the post.'
      end
    end
  end
  