class AddRorderToRproduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :rorders, :rproduct, foreign_key: true
  end
end
