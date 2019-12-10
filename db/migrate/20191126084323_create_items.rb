class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      t.integer :prefecture_code, null: false
      t.integer :status, null: false,default: 0
      t.string :upper_category, null: false, foreign_key: true
      t.string :middle_category, null: false, foreign_key: true
      t.string :lower_category, null: false, foreign_key: true
      t.string :size_type, null: false, foreign_key: true
      t.string :seller, null: false, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
