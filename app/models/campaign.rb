class Campaign < ApplicationRecord
    validates :title, presence: true
    validates :party, presence: true
    validates :level, presence: true
    validates :c_notes, presence: true
    validates :dm_notes, presence: true
    validates :user_id, presence: true
end

#if these items are not present, the campaign is invalid and will not be saved