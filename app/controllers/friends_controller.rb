class FriendsController < ApplicationController
  def list
    if !params[:search].nil?
      @friends = current_user.friends.where(username: params[:search])
      @friend_ids = @friends.pluck(:id)
      @friendships = current_user.friendships.where('friend_a_id IN (?) OR friend_b_id IN (?)', @friend_ids, @friend_ids)
    else
    @friendships = current_user.friendships
    @friends = current_user.friends 
    end
  end
 
end
