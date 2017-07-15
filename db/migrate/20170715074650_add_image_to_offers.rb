class AddImageToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :image, :json
  end
end
