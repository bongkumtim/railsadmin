class AddClosingInventoryToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :closing_inventory, :decimal, precision: 12, scale: 2
  end
end
