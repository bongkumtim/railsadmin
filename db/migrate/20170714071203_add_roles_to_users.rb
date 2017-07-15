class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superadmin, :boolean, default: false
    add_column :users, :merchant, :boolean, default: false
    add_column :users, :normal, :boolean, default: true
  end
end
