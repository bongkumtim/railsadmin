class AddRecurringPaymentBankToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :recurring_payment_bank, :string
    add_column :accounts, :recurring_payment_bank_description, :string
    add_column :accounts, :recurring_payment_bank_amount, :decimal, precision: 12, scale: 2
  end
end
