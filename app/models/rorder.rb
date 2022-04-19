class Rorder < ApplicationRecord
    belongs_to :rproduct
    validates :quantity,presence: true, numericality:{:greater_than => 0}
end
