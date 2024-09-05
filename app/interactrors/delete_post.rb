class DeletePost
  include Interactor
  def call
    Post.destroy(context.id)
    context.success!
  end
end
