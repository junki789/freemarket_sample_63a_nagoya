class AdditemIdTosellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :item_id, :integer
  end
end
