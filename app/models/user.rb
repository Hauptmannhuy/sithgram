class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:email,:username]
# has_many :posts
has_many :friends, class_name: "User"
has_many :requests, foreign_key: 'request_receiver_id'
end
