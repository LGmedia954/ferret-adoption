class Owner < ApplicationRecord
    has_secure_password
    #bypass "unknown attribute 'password' for Owner" with bcrypt
    #attr_accessible :email, :password, :password_confirmation

    has_many :ferrets, dependent: :destroy
    has_many :opportunities, dependent: :destroy
    has_many :ferret_adoptions, through: :opportunities
    accepts_nested_attributes_for :ferrets
    accepts_nested_attributes_for :opportunities
 
    validates_presence_of :first_name, :last_name, :phone, :zipcode, :quantity
    validates :email, uniqueness: true, presence: true
    validates_format_of :email,:with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :phone, length: { is: 10 }

    before_save { self.email = email.downcase }

    def to_s
      #"#{first_name} #{last_name}"
      self.first_name + " " + self.last_name
    end

    def self.need_fuzzies
      self.where("quantity < 2")
    end

    def self.big_busyness
      self.where("quantity >= 4")
    end

end