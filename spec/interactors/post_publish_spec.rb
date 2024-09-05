require 'rails_helper'

describe PublishPost do
  describe '.call' do
    context 'when given correct data' do
      before do
        @user = create(:user)
        @params = {body: 'post description' }
      end
      it 'creates post' do
        result = PublishPost.call(params: @params, user: @user )
        expect(result).to be_a_success
      end
    end
    context 'when given incorrect data' do
      before do
        @user = create(:user)
        @params = {body: '' }
      end
      it 'throws an error' do
        result = PublishPost.call(params: @params, user: @user )
        expect(result).to be_a_failure
      end
    end
  end
end
