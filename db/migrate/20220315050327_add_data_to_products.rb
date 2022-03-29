class AddDataToProducts < ActiveRecord::Migration[7.0]
  def change
    Product.create(name:"Macbook",price:123000,brand:"Apple")
  end
end
