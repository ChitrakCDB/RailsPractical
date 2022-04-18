class Event < ApplicationRecord
  belongs_to :myuser
  has_many :enrolled_users
  belongs_to :category
  validates :name, presence: true,format: { with:  /\A[A-Za-z]+\Z/ }
  validate :eventdate_past
  has_many :comments
  def eventdate_past
    if (self.event_date.present?) && (self.event_date < Date.today)
      errors.add(:event_date, "Event can't be in past")
    end
  end
end
