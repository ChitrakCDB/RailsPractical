class Customer < ApplicationRecord
    validates :fname, :lname, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
    validates :phone, length: {is: 10},numericality: { only_integer: true }
    has_many :orders,dependent: :destroy
end
