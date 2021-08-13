class Opportunity < ApplicationRecord
    belongs_to :ferret
    belongs_to :owner

    validates :title, presence: true
    validates :circumstance, length: { maximum: 500 }

    scope :open_case, -> { where(active: 'true') }


  def self.connection  #Rails kept asking for this before every view.
    retrieve_connection 
  end

  def organizer
    Owner.find(self.owner_id).last_name
  end


end