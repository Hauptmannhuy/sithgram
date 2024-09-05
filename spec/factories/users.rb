FactoryBot.define do
  factory :user, class: "User" do
    username { Faker::Internet.username(specifier: 5..8) }
    email { Faker::Internet.email }
    password {123456}
  end
end
