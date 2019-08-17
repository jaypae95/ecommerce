class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
    add_column :users, :gender, :string
    add_column :users, :u_id, :string
    add_index :users, :u_id, unique: true
    add_index :users, :contact, unique: true
  end
end
