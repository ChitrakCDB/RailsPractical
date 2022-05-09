class TestProduct < ApplicationRecord
  validates :price,presence: true, numericality:{:greater_than => 0}
  validates :product_name,presence: :true
  validates :description,presence: :true
  belongs_to :renduser
end
