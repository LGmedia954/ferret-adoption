class Owner < ApplicationRecord
    #bypass "unknown attribute 'password' for Owner" with bcrypt
    #attr_accessible :email, :password, :password_confirmation
    attr_accessor :password, :password_confirmation
    has_secure_password

    #I got further along with the above code, 
    #but password is coming through as nil.

    has_many :ferrets, dependent: :destroy
    has_many :opportunities, dependent: :destroy
    has_many :ferrets, through: opportunities
    accepts_nested_attributes_for :ferrets

    def self.connection  #Rails kept asking for this before every view.
      retrieve_connection 
    end
    
    #validates :password, :confirmation => true
 
    validates_presence_of :first_name, :last_name, :phone, :zipcode, :quantity
    validates :email, uniqueness: true, presence: true
    validates :phone_number, length: { is: 9 }

    before_save { self.email = email.downcase }

    def to_s
      #"#{first_name} #{last_name}"
      self.first_name + " " + self.last_name
    end

  
end