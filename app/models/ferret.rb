class Ferret < ApplicationRecord
    belongs_to :owner, required: true
    has_many :opportunities
    has_many :owners, through: :opportunities

    def self.connection  #Rails kept asking for this before every view.
      retrieve_connection 
    end

    validates_presence_of :name, :age, :sex, :color, :health, :description

    scope :for_adoption, -> { where(home: 'false') }
    scope :found_home, -> { where(home: 'true') }
    

end