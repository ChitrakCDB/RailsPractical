class Rproduct < ApplicationRecord
    validates :price,presence: true, numericality:{:greater_than => 0}
    validates :name,presence: :true
    has_many :rorders, dependent: :destroy
end
