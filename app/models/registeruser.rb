class Registeruser < ApplicationRecord
    #has_secure_password
    validates_presence_of :first_name, :last_name, :email
    validates :email, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :authenticate, on: :update
  
    def authenticate
        userupdate = Registeruser.find_by_id(self.id)
        if self.email != userupdate.email and self.password != userupdate.password
            errors.add(:base,"Password is incorrect")
        else  
            self.password = userupdate.password
        end
    end
  end
  