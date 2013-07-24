class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    #this index is like indexing in a book
    add_index :users, :email, :unique => true
  end

  def down
    remove_index :users, :email
  end
end
