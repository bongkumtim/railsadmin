class AddListIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :list_id, :integer
  end
end
