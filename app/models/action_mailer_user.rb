class ActionMailerUser < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
end
