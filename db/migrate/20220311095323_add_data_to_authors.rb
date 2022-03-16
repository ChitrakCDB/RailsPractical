class AddDataToAuthors < ActiveRecord::Migration[7.0]
  def change
    Author.create(firstname:"Keyur", lastname:"Patel", dob:"Mon, 26 Jun 2000", email:"keyurpatel@cmail.com")
    Author.create(firstname:"Tejas", lastname:"Gamit", dob:"Mon, 26 Jul 2000", email:"tejasg@cmail.com")
  end
end
