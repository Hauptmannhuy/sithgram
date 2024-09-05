class PublishPost
  include Interactor
  def call
    user = context.user
    post = user.posts.build(context.params)
    if post.save
      context.success!
    else
      context.post = post
      context.fail!
    end
  end
end
