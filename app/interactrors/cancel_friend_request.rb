class CancelFriendRequest
  include Interactor
  def call
    Request.destroy(context.id)
    context.success!
  end
end
