class MakeFriend
  include Interactor
  def call
    Request.destroy_by(request_receiver_id: context.params[:friend_a_id], request_sender_id: context.params[:friend_b_id])
    Friendship.create!(context.params)
    context.success!
  end
end
