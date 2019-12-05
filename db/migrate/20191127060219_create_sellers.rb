class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.integer :user, foreign_key: true
      t.integer :item, foreign_key: true
      t.timestamps
    end
  end
end
