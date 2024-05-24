class RequestsController < ApplicationController
  def index
    @user = current_user
    @requests = current_user.requests
    @friendship = Friendship.new
  end
  def destroy
   Request.destroy(params[:id]) 
  end

  def create
    @receiver = User.find(permitted_params[:request_receiver_id])
    @receiver.requests.create!(permitted_params)
  end


  private
 def permitted_params
  params.require(:request).permit(:request_receiver_id,:request_sender_id)
 end
end
