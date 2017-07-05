class AddAssetPurchaseBankToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :depreciation_bank, :decimal, precision: 8, scale: 2
    add_column :accounts, :asset_purchase_bank, :string
    add_column :accounts, :asset_purchase_bank_description, :string
    add_column :accounts, :asset_purchase_bank_amount, :decimal, precision: 12, scale: 2
  end
end
