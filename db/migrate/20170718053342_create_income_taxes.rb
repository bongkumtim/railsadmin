class CreateIncomeTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :income_taxes do |t|
      t.string :title
      t.decimal :amount, precision: 12, scale: 2
      t.string :description
      t.json :image

      t.timestamps
    end
  end
end
