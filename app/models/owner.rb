class Owner < ApplicationRecord
    has_many :ferrets
    has_many :opportunities
    has_many :gifted_ferrets, through: opportunities

    #has_secure_password
    #validates_presence_of :name, :email
    

    def to_s
      "#{first_name} #{last_name}"
    end

    def surrender
      
    end

    def adopt
      
    end
  
end
