class UsersController < ApplicationController
  def index
    @users = current_user.find_not_friends_of_user
  end

end