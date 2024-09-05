require 'rails_helper'

describe CancelFriendRequest do
  describe '.call' do
    before do
      @receiver = create(:user)
      @sender = create(:user)
      @request = @receiver.requests.create(request_receiver_id: @receiver.id, request_sender_id: @sender.id)
    end
    it 'cancels a friend request' do
      expect { CancelFriendRequest.call(id: @request.id) }.to change{@sender.sent_requests.empty?}.from(false).to(true)
    end
  end



end
