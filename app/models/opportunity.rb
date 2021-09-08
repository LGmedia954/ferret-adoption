class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: true) }
    scope :recent, -> { order(created_at: :desc) }


end

# I plan to revisit this project on a new branch, 
# adding a separate AdoptionRequest table
# and reworking model relationships.