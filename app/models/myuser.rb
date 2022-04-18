class Myuser < ApplicationRecord
    has_secure_password
    has_many :events
    has_many :enrolled_users
    has_many :categories
    has_one :address
    accepts_nested_attributes_for :address
    has_many :likes, dependent: :destroy
    has_many :comments
end
