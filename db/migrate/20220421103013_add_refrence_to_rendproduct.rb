class AddRefrenceToRendproduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :rendproducts, :renduser
  end
end
