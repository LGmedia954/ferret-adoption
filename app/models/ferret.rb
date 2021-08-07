class Ferret < ApplicationRecord
    belongs_to :owner
    has_many :opportunties
    has_many :owners, through: opportunities
    
end
