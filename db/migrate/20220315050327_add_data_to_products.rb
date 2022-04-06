class AddDataToCustomers < ActiveRecord::Migration[7.0]
  def change
    Customer.create(name:"Macbook",price:123000,brand:"Apple")
  end
end
