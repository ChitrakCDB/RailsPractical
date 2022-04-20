class AddMyroductAndCustomerToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :myproduct
  end
end
