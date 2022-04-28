class AddPicturesToActionMailerUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :action_mailer_users, :picture, :string
  end
end
