require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'belongs to' do
    it 'user' do
      expect((Friendship).reflect_on_association(:friend_a).class_name).to eq('User')        
    end
  end
end
