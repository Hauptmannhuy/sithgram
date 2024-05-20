class FriendshipsController < ApplicationController
  def create
    current_user.requests.destroy_by(request_receiver_id: permitted_params[:friend_a_id], request_sender_id: permitted_params[:friend_b_id])
    Friendship.create!(permitted_params)
  end

  def destroy

  end
  private
  def permitted_params
    params.require(:friendship).permit(:friend_a_id,:friend_b_id)
  end
end
