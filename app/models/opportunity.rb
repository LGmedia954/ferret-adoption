class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: true) }
    scope :recent, -> { order(created_at: :desc) }

    def organizer
      Owner.find(self.owner_id).last_name
    end


end