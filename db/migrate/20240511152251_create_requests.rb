class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.integer :requested_user_id
      t.timestamps
    end
  end
end
