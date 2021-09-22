Animal Adoption App

Ferret

belongs_to :owner
has_many :opportunities
has_many :owners, through: :opportunities
has_many :adoption_requests, through: :opportunities

- are colorful and want happy homes with responsible owners

Owner

has_many :dogs, dependent: :destroy
has_many :ferrets, dependent: :destroy
has_many :opportunities, dependent: :destroy
has_many :adoption_requests_as_adopter, foreign_key: :adopter_id, class_name: 'AdoptionRequest'
has_many :adoption_requests_as_owner, through: :opportunities, source: :adoption_requests

- wishes to connect with other ferret owners so that ferrets can be rehomed safely
- some are looking to rehome
- others are looking to adopt

Opportunity

belongs_to :ferret
belongs_to :owner
has_many :adoption_requests

- notes the circumstance that connects owners and ferrets

Adoption_Request

belongs_to :adopter, class_name: 'Owner'
belongs_to :opportunity
has_one :ferret, through: :opportunity
has_one :owner, through: :opportunity

- created to allow for multiple adoption requests
