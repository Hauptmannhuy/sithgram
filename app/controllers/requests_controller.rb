class RequestsController < ApplicationController
  def index
  end

  def create
    
  end

  def destroy
  end

  private
 def permitted_params
  params.require(:request).permit(:request_sender_id,:request_receiver_id)
 end
end
