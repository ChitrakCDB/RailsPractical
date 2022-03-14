class AddColumnToAuthors < ActiveRecord::Migration[7.0]

  def up
    #add_column :authors, :about, :text
  end

  def down
    remove_column :authors, :about, :text
  end
end
