class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:email,:username]
has_many :posts
has_many :requests, foreign_key: 'request_receiver_id'

  def friendships
    Friendship.where('friend_a_id = ? OR friend_b_id = ?',self.id,self.id)
  end

  def friends_ids
    ids_list = self.friendships.pluck.map do |el|
    el[1] != self.id ? el[1] : el[2]
    end
    ids_list
  end

  def friends
    list = friends_ids
    User.where(id:list)
  end

  def find_not_friends_of_user
    list = self.friends_ids
    User.where('id != ? AND id != ?',list.empty? ? self.id : list, self.id)
  end

  end
