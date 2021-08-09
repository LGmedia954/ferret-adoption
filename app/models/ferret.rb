class Ferret < ApplicationRecord
    belongs_to :owner
    has_many :opportunties
    has_many :owners, through: opportunities

    validates_presence_of :name, :age, :sex, :color, :health, :description
    
end
