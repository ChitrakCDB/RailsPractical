class RemoveColumnFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :title, :string
    remove_column :products, :description, :string
    remove_column :products, :capacity, :integer
    remove_column :products, :is_active, :boolean
    remove_column :products, :status, :integer, default: 0
  end
end
