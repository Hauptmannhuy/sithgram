class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.integer :requested_sender_id
      t.integer :requested_receiver_id
      t.timestamps
    end
  end
end
