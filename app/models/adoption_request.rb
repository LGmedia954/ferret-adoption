class AdoptionRequest < ApplicationRecord
  belongs_to :adopter, class_name: 'Owner'
  belongs_to :opportunity
  has_one :ferret, through: :opportunity
  has_one :owner, through: :opportunity
end