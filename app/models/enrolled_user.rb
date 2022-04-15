class EnrolledUser < ApplicationRecord
    belongs_to :myuser
    belongs_to :event
end
