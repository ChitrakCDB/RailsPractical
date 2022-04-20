class AddRefrenceToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :myuser
  end
end
