class AddOpenCashDescriptionToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :open_cash_description, :string
  end
end
