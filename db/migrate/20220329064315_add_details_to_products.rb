class AddDetailsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :string
    add_column :products, :capacity, :integer
    add_column :products, :is_active, :boolean
    add_column :products, :status, :integer, default: 0
  end
end
