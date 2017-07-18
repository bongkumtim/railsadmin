class AddUserIdToIncomeTaxes < ActiveRecord::Migration[5.0]
  def change
    add_column :income_taxes, :user_id, :integer
  end
end
