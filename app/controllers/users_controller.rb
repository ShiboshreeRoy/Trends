class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @posts = @user.posts.order(created_at: :desc)
    end
    private

    def ensure_valid_id
      unless params[:id] =~ /\A\d+\z/ # Check if ID is numeric
        redirect_to root_path, alert: "Invalid user ID"
      end
    end
end