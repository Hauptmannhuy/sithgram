class DeleteFriend
  include Interactor
  def call
    Friendship.destroy(context.id)
    context.success!
  end
end
