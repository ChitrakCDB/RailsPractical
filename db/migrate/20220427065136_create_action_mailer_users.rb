class CreateActionMailerUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :action_mailer_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
