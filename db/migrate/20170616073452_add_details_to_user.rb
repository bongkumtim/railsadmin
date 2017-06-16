class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :business_type, :string
    add_column :users, :address, :string
    add_column :users, :company_name, :string
    add_column :users, :company_no, :integer
  end
end
