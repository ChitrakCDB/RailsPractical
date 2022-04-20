class CreateEnrolledUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :enrolled_users do |t|

      t.timestamps
    end
  end
end
