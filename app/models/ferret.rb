class Ferret < ApplicationRecord
    belongs_to :owner
    has_many :opportunities
    has_many :owners, through: :opportunities
    has_many :adoption_requests, through: :opportunities

    validates_presence_of :name, :age, :sex, :color, :health, :description

    scope :for_adoption, -> { where(home: true) }
    scope :found_home, -> { where(home: false) }
    scope :by_name, -> { order(name: :asc) }

end