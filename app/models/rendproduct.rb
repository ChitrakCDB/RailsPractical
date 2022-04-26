class Rendproduct < ApplicationRecord
  validates :price,presence: true, numericality:{:greater_than => 0}
  validates :name,presence: :true
  belongs_to :renduser
  has_many :rendorders, dependent: :destroy
end
