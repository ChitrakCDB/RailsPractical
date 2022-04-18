class Comment < ApplicationRecord
    belongs_to :myuser
    validates :content, presence: true
end
