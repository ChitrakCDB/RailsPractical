class AddUserRefrenceToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :myuser
    add_reference :comments, :event
  end
end
