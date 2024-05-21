class UsersController < ApplicationController
  def index
    @users = current_user.find_not_friends_of_user
  end

  def show
    @user = User.find(params[:id])
  end

end