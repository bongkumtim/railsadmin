class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.decimal :opening_cash, precision: 12, scale: 2
      t.decimal :opening_bank, precision: 12, scale: 2
      t.integer :user_id
      t.string :bank
      t.json :image
      t.decimal :cash_collection_amount, precision: 12, scale: 2
      t.string :cash_collection_description
      t.decimal :cash_purchase_amount, precision: 12, scale: 2
      t.string :cash_purchase_description
      t.decimal :credit_purchase_amount, precision: 12, scale: 2
      t.string :credit_purchase_description
      t.string :creditor_name
      t.decimal :payment_creditor_cash_amount, precision: 12, scale: 2
      t.string :payment_creditor_cash_description
      t.decimal :payment_creditor_bank_amount, precision: 12, scale: 2
      t.string :payment_creditor_bank_description
      t.decimal :card_collection_amount, precision: 12, scale: 2
      t.string :card_collection_description
      t.integer :card_charges
      t.decimal :bank_transfer_amount, precision: 12, scale: 2
      t.string :bank_transfer_description
      t.decimal :fpx_collection_amount, precision: 12, scale: 2
      t.string :fpx_collection_description
      t.decimal :fpx_charges, precision: 6, scale: 2

      t.timestamps
    end
  end
end
