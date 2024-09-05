class SendFriendRequest
  include Interactor
  def call
    receiver = User.find(context.params[:request_receiver_id])
    request = receiver.requests.build(context.params)
    if request.save
      context.request = request
      context.success!
    else
      context.fail!(error: 'Request could not be created')
    end
  end
end
