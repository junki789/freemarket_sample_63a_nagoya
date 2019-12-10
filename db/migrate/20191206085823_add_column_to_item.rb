class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :category_id, :integer
    add_column :items, :condition_id, :integer
    add_column :items, :delivery_charge, :string
    add_column :items, :delivery_days, :string
  end
end
