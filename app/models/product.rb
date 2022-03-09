class Product < ApplicationRecord
    #Applying validations to the fields
    validates :name, presence: true
    validates :price, presence: true, numericality:{:greater_than => 0}
    validates :brand, presence: true   
end
