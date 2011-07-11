class CreateHighfives < ActiveRecord::Migration
  def change
    create_table :highfives do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
