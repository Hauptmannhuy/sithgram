require 'rails_helper'

describe MakeFriend do
  before do
    @receiver = create(:user)
    @sender = create(:user)
    @params = {friend_a_id: @receiver.id, friend_b_id: @sender.id}
    Request.create(request_receiver_id: @receiver.id, request_sender_id: @sender.id)
  end
  it 'creates a friendship' do
    result = MakeFriend.call(params: @params)
    expect(result).to be_a_success
  end
end
