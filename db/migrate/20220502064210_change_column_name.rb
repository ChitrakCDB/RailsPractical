class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :api_comments,:comment, :content
  end
end
