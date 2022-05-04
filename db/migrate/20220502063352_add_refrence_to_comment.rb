class AddRefrenceToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :api_comments, :article
  end
end
