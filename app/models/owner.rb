class Owner < ApplicationRecord
    has_secure_password

    has_many :ferrets, dependent: :destroy
    has_many :opportunities, dependent: :destroy
    has_many :ferret_adoptions, through: :opportunities, source: :ferret
    accepts_nested_attributes_for :ferrets, :opportunities
 
    validates_presence_of :first_name, :last_name, :phone, :zipcode, :quantity
    validates :email, uniqueness: true, presence: true
    validates_format_of :email,:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :phone, length: { is: 10 }

    before_save { self.email = email.downcase }

    scope :sort_name, -> { order(first_name: :asc) }

    def self.need_fuzzies
      self.where("quantity < 2")
    end

    def self.big_busyness
      self.where("quantity >= 3")
    end

end