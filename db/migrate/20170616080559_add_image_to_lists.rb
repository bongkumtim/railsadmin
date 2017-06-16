class AddImageToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :image, :json
  end
end
