class FriendshipsController < ApplicationController
  def create
    MakeFriend.call(params: permitted_params)
  end

  def destroy
    DeleteFriend.call(id:params[:id])
    redirect_to friends_list_url
  end
  private
  def permitted_params
    params.require(:friendship).permit(:friend_a_id,:friend_b_id)
  end
end
