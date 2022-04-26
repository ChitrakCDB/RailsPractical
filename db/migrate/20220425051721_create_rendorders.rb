class CreateRendorders < ActiveRecord::Migration[7.0]
  def change
    create_table :rendorders do |t|
      t.integer :quantity
      
      t.timestamps
    end
  end
end
