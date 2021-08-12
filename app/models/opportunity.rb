class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

end



def self.connection  #Rails kept asking for this before every view.
  retrieve_connection 
end