class UniqueAndPresence < ActiveRecord::Migration[7.0]
  def change
    # change_column :users, :username, :string, null:false, index: {unique:true}
    remove_column :users, :username
  end
end
