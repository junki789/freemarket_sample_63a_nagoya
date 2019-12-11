class RemoveitemIdToitems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :item_id, :integer
  end
end
