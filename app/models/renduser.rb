class Renduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { merchant: 0, admin: 1 }
  validates :role, presence: :true
  has_many :rendproducts, dependent: :destroy
  has_many :test_products, dependent: :destroy
end
