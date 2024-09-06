class CreateComment
  include Interactor
  def call
    post = Post.find(context.post_id)
    comment = post.comments.new(context.params)
    if comment.save
      context.post = post
      context.comment = comment
      context.success!
    else
      context.fail!
    end
  end

end
