class UsersController < ApplicationController
  def index
    @users = current_user.find_not_friends_of_user
    @requested_users = Hash.new
    current_user.sent_requests.where('request_receiver_id != ?', current_user.id).pluck(:request_receiver_id,:id).each{|el| @requested_users[el.first] = el.last}
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
  end

end