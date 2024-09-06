require 'rails_helper'

describe PostComment do
  context 'when input data is correct' do
    before do
      @user = create(:user)
      @post = @user.posts.create(body: 'test post')
      @params = {body: 'test comment', user_id: @user.id}
    end
    it 'successfully creates comment' do
      result = PostComment.call(params: @params, post_id: @post.id)
      expect(result).to be_a_success
    end
  end
  context 'when input data is incorrect' do
    before do
      @user = create(:user)
      @post = @user.posts.create(body: 'test post')
      @params = {body: '', user_id: @user.id}
    end
    it 'fails to create a comment' do
      result = PostComment.call(params: @params, post_id: @post.id)
      expect(result).to be_a_failure
    end
  end
  context 'when user is doing comment spam' do
    before do
      @user = create(:user)
      @post = @user.posts.create(body: 'test post')
      @params = {body: 'test comment', user_id: @user.id}
    end
    it 'fails to create a comment and throws an error' do
      error = 'Spam detected! You have to wait 2 minutes before you can leave comments.'
      result = nil
      6.times{ result = PostComment.call(params: @params, post_id: @post.id) }
      expect(result).to be_a_failure
      expect(result.error).to eq(error)
    end

    end

  end
