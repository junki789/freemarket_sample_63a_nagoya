class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user, foreign_key: true
      t.integer :item, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
