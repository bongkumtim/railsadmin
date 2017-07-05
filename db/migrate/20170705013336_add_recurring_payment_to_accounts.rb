class AddRecurringPaymentToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :recurring_payment, :string
    add_column :accounts, :recurring_payment_description, :string
    add_column :accounts, :recurring_payment_amount, :decimal, precision: 12, scale: 2
  end
end
