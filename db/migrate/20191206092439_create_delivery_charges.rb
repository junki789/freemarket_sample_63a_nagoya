class CreateDeliveryCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_charges do |t|

      t.timestamps
    end
  end
end
