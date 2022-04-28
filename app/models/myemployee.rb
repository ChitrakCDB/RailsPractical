class Myemployee < ApplicationRecord
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :mobile_number, length: {is: 10}, numericality: { only_integer: true }
    has_many :myaddresses
    accepts_nested_attributes_for :myaddresses
end
