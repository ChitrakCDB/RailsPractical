class AddRefrenceToMyaddress < ActiveRecord::Migration[7.0]
  def change
    add_reference :myaddresses, :myemployee
  end
end
