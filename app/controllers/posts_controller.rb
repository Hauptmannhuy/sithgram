class PostsController < ApplicationController
  def index
    @posts = current_user.relative_posts
  end

  def show
   
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(permitted_params)
    if post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
  end

  private

  def permitted_params
    params.require(:post).permit(:body)
  end

end
