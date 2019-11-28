class CreateSizeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :size_types do |t|
      t.string :name, null: false
      t.references :size, null: false
      t.timestamps null: false, foreign_key: true
    end
  end
end
