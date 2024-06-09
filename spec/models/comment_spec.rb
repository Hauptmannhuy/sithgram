require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'belongs to' do
    it 'user' do
        expect((Comment).reflect_on_association(:user).macro).to eq(:belongs_to)
    end
    it 'post' do
      expect((Comment).reflect_on_association(:post).macro).to eq(:belongs_to)
  end
  end
end
