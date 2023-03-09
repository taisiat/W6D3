class UsernameUpdate < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique:true, presence:true
    remove_column :users, :name
    remove_column :users, :email
  end
end
