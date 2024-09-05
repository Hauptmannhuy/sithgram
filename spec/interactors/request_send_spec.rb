require 'rails_helper'

describe SendFriendRequest do
  describe '.call' do
    subject(:context){SendFriendRequest.call(params: params)}
      let(:request){double(:request)}
      let(:receiver){create(:user)}
      let(:sender){create(:user)}
      let(:params){ { request_receiver_id: receiver.id, request_sender_id: sender.id } }
      before do
        allow(User).to receive(:find).with(receiver.id).and_return(receiver)
        allow(receiver.requests).to receive(:build).with(params).and_return(request)
        allow(request).to receive(:save).and_return(true)
      end
      it 'creates a request' do
          expect(context).to be_a_success
        end
    end
end
