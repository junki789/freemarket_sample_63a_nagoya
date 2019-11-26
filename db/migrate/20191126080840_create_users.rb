class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :email
      t.integer :phone_number
      t.string :password
      t.integer :birth_day
      t.integer :birth_month
      t.integer :birth_year
      t.string :self_introduce
      t.timestamps
    end
  end
end
