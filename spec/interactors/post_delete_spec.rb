require 'rails_helper'

describe DeletePost do
  before do
    @user = create(:user)
    @post = @user.posts.create(body: 'body post')
  end
  it 'successfully deletes a post' do
    result = DeletePost.call(id: @post.id)
    expect(result).to be_a_success
  end
end
