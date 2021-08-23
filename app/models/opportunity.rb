class Opportunity < ApplicationRecord
    belongs_to :ferret, inverse_of: :opportunity
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: true) }
    scope :recent, -> { order(created_at: :desc) }


end