require 'rails_helper'

RSpec.describe User, type: :model do
 context 'has associations with' do
  it 'model friendship' do
    t = Friendship.reflect_on_association(:friend_a)
    expect(t.class_name).to eq("User")
  end
  it 'model post' do       
    t = User.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end
  it 'model like' do       
    t = User.reflect_on_association(:likes)
    expect(t.macro).to eq(:has_many)
  end
  it 'model comment' do 
    t = User.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
  it 'model request' do 
     expect(User.reflect_on_association(:sent_requests).macro).to eq(:has_many)
    expect(User.reflect_on_association(:requests).macro).to eq(:has_many)
  end
 end
end
