class FriendsController < ApplicationController
  def list
    @friendships = current_user.friendships
    @friends = current_user.friends
  end
  
  def show

  end
end
