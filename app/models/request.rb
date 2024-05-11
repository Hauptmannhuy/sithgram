class Request < ApplicationRecord
  belongs_to :user, foreign_key: :request_receiver_id
end
