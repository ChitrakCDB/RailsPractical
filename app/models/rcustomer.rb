class Rcustomer < ApplicationRecord
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :phone, length: {is: 10},numericality: { only_integer: true }
    validates :name, presence: :true
end
