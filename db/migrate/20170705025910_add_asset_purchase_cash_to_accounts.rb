class AddAssetPurchaseCashToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :depreciation_cash, :decimal, precision: 8, scale: 2
    add_column :accounts, :asset_purchase_cash, :string
    add_column :accounts, :asset_purchase_cash_description, :string
    add_column :accounts, :asset_purchase_cash_amount, :decimal, precision: 12, scale: 2
  end
end
