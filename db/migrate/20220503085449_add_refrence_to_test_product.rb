class AddRefrenceToTestProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :test_products, :renduser
  end
end
