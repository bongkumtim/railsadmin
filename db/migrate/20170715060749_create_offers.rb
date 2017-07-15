class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
