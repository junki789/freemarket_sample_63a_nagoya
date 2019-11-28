class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code1, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :town
      t.integer :house_number
      t.timestamps
    end
  end
end
