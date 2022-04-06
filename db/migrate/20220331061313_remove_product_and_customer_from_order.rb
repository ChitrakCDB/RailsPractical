class RemoveProductAndCustomerFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :product
  end
end
