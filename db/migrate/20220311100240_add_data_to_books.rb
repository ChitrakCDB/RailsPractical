class AddDataToBooks < ActiveRecord::Migration[7.0]
  def change
    Book.create(name:"book1", price:23, author_id:4)
    Book.create(name:"book2", price:23, author_id:4)
    Book.create(name:"book3", price:23, author_id:5)
  end
end
