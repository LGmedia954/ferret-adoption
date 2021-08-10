class Owner < ApplicationRecord
    has_many :ferrets
    has_many :opportunities
    has_many :ferrets, through: opportunities
    
    #has_secure_password
    validates_presence_of :first_name, :last_name, :email, :phone, :zipcode, :quantity
    validates :email, uniqueness: true
    validates :phone_number, length: { is: 9 }
    validates_inclusion_of :quantity, :in => 1..12

    
    def connection  #Rails kept asking for this before every view.
      retrieve_connection 
    end

    def to_s
      self.first_name + " " + self.last_name
    end

    def surrender
      
    end

    def adopt

    end
  
end
