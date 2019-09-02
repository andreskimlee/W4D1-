class CreateRemoveEmail < ActiveRecord::Migration[5.2]
  def change # is this the most efficient way to change a previously made migration? Do we need to remove an index of a column we removed? 
    remove_column :users, :email 
    remove_column :users, :name 
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
