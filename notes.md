Animal Adoption App

Ferret

belongs_to :owner
has_many :opportunties
has_many :owners, through: opportunities

- are colorful and want happy homes with responsible owners

Owner

has_many :ferrets
has_many :opportunities
has_many :ferrets, through: opportunities

- wishes to connect with other ferret owners so that ferrets can be rehomed safely
- some are looking to rehome
- others are looking to adopt

Opportunity

belongs_to :ferret
belongs_to :owner

- notes the circumstance that connects owners and ferrets
