class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner
    has_many :adoption_requests

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: true) }
    scope :recent, -> { order(created_at: :desc) }


end


# Added a separate AdoptionRequest table
# and reworking model relationships.