class Request < ApplicationRecord
  belongs_to :receiver, foreign_key: :request_receiver_id, class_name: 'User'
  belongs_to :sender, foreign_key: :request_sender_id, class_name: 'User'
end
