class AddRefrenceToEnrolledUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrolled_users, :event
    add_reference :enrolled_users, :myuser
  end
end
