class UsersController < ApplicationController
  def index
    @users = current_user.find_not_friends_of_user
    @requested_users = current_user.sent_requests.pluck(:request_receiver_id)
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
  end

end