class AddRefrenceToRendorders < ActiveRecord::Migration[7.0]
  def change
    add_reference :rendorders, :rendproduct
  end
end
