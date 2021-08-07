class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    def share_circumstance
        self.title + " - " + self.circumstance
      end


end
