class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner
    belongs_to :adopter, class_name: :owner, foreign_key: "adopter_id"

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: true) }
    scope :recent, -> { order(created_at: :desc) }


end