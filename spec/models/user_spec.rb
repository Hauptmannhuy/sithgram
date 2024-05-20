require 'rails_helper'

RSpec.describe User, type: :model do
 context 'friends suggestions' do
  it 'exists' do
    requests = User.new.requests
    expect(requests).not_to be_nil
  end
 end
end
