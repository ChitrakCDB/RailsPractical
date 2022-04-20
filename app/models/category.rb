class Category < ApplicationRecord
    belongs_to :myuser
    has_many :event, dependent: :destroy
    validates :name, uniqueness: true, format: { with:  /\A[A-Za-z]+\Z/ }
end
