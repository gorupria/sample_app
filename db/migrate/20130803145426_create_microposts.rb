class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    #is in 1102, timestamp: 3:00
    add_index :microposts, :user_id
  end
end
