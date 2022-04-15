class CreateMyusers < ActiveRecord::Migration[7.0]
  def change
    create_table :myusers do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
