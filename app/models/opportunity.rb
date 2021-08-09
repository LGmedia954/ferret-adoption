class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

end