class Order < ApplicationRecord
  validates :quantity, numericality:{:greater_than => 0}
  enum :status, { Booked: 0, Cancelled: 1 }
  belongs_to :myproduct
  belongs_to :customer
end
