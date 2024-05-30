class RequestsController < ApplicationController
  def index
    @user = current_user
    @requests = current_user.requests
    @friendship = Friendship.new
  end

  def destroy
    @post_id = params[:post_id]
    @user_id = params[:user_id]
   Request.destroy(params[:id]) 
   respond_to do |format|
    format.turbo_stream
  end
  end

  def create
    @requested_users = params[:requested_users]
    @post_id = params[:post_id]
    @receiver = User.find(permitted_params[:request_receiver_id])
    @user_id = @receiver.id
   @request = @receiver.requests.create!(permitted_params)
    respond_to do |format|
      format.turbo_stream
    end
  end


  private
 def permitted_params
  params.require(:request).permit(:request_receiver_id,:request_sender_id)
 end
end
