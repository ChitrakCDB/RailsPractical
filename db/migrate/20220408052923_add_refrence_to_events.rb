class AddRefrenceToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :myuser
    add_reference :events, :category
  end
end
