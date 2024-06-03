class UsersController < ApplicationController
  def index
    @users = !params[:search].nil? ? User.where(username: params[:search]) : current_user.find_not_friends_of_user
    @pending_users = current_user.requests.pluck(:request_sender_id)
    @requested_users = Hash.new
    current_user.sent_requests.where('request_receiver_id != ?', current_user.id).pluck(:request_receiver_id,:id).each{|el| @requested_users[el.first] = el.last}
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(permitted_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
    @friends = @user.friends.count

  end

  private

  def permitted_params
    params.require(:user).permit(:avatar)
  end

end