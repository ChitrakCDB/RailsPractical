class Myproduct < ApplicationRecord
    validates :price, :capacity, numericality:{:greater_than => 0}
    enum :status, { InStock: 1, OutOfStock: 2, ComingSoon: 0 }
    default_scope { where('is_active = ?', true)}
    has_many :orders
end
