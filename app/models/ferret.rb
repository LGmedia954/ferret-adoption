class Ferret < ApplicationRecord
    belongs_to :owner
    has_many :opportunities
    has_many :owners, through: opportunities

    validates_presence_of :name, :age, :sex, :color, :health, :description

    scope :for_adoption, -> { where(home: 'false') }
    scope :found_home, -> { where(home: 'true') }
    

  def self.connection  #Rails kept asking for this before every view.
    retrieve_connection 
  end

end