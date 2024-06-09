require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'belongs to' do
    it 'user' do 
      expect((Post).reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
  context 'has many' do
    it 'comments' do
      expect((Post).reflect_on_association(:comments).macro).to eq(:has_many)

    end
    it 'likes' do
      expect((Post).reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end
end
