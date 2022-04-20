class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
        t.string :name
        t.integer :price
        t.string :brand
        t.timestamps
    end
  end
end
