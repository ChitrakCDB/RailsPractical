class CreateApiComments < ActiveRecord::Migration[7.0]
  def change
    create_table :api_comments do |t|
      t.string :comment
      t.date :date_of_comment

      t.timestamps
    end
  end
end
