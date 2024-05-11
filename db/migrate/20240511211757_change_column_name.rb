class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :requests, :requested_user_id, :request_sender_id
    add_column :requests, :request_receiver_id, :integer
  end
end
