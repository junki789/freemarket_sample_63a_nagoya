class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :ancestry
      t.string :size, foreign_key: true
      t.timestamps
    end
  end
end
