class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2],:authentication_keys => [:email,:username]
        #  :authentication_keys => [:email,:username]
has_many :posts
has_many :requests, foreign_key: 'request_receiver_id'
has_many :sent_requests, foreign_key: 'request_sender_id', class_name: 'Request'
has_many :likes, through: :posts
has_many :comments, through: :posts

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
    list = self.friends_ids << self.id
    User.where.not(id: list)
  end

  def relative_posts
    list = self.friends_ids << self.id
    Post.where(user_id: list)
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  end
