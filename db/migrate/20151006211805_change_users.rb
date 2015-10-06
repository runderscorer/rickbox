class ChangeUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :password
    add_column :users, :password_salt, :string
    add_column :users, :password_hash, :string
  end

  def self.down
    add_column :users, :password, :string
    remove_column :users, :password_salt
    remove_column :users, :password_hash
  end
end
