class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  
 def user_liked?(user_id)
  return true if !self.likes.where(user_id:user_id).empty?
  false
 end
end
