class RequestsController < ApplicationController
  def index
  end
  def destroy
  end

  def create
    @receiver = current_user
    @receiver.requests.create!(permitted_params)
  end


  private
 def permitted_params
  params.require(:request).permit(:request_sender_id)
 end
end
