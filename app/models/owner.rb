class Owner < ApplicationRecord
    has_many :ferrets, dependent: :destroy
    has_many :opportunities, dependent: :destroy
    has_many :ferrets, through: opportunities
    #accepts_nested_attributes_for :ferrets
    
    has_secure_password
    validates_presence_of :first_name, :last_name, :phone, :zipcode, :quantity
    validates :email, uniqueness: true, presence: true
    validates :phone_number, length: { is: 9 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    
    def is_valid_email?(email)
      email =~ VALID_EMAIL_REGEX
    end

    def self.connection  #Rails kept asking for this before every view.
      retrieve_connection 
    end

    def to_s
      #"#{first_name} #{last_name}"
      self.first_name + " " + self.last_name
    end

  
end