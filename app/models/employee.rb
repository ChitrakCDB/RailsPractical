class Employee < ApplicationRecord
    validates :firstname, :lastname, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :age, numericality: { only_integer: true }
    validates :no_of_order, numericality: { only_integer: true }
    validates :salary, numericality: true
    
end
