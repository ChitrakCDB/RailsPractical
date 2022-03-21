class Faculty < ApplicationRecord
    validates :firstname, :lastname, presence: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true
    validates :phone_num, length: {is: 10},numericality: { only_integer: true }
    validate :birthdate_future
    validate :designation_valid
    
  def birthdate_future
    if (self.DOB.present?) && (self.DOB > Date.today)
      errors.add(:DOB, "birthdate can't be in future")
    end
  end
  
  def designation_valid
    if designation == "Ass. Prof." || designation == "Prof."
    else
      errors.add(:designation, "can't be #{designation} can only be 'Ass. Prof.' or 'Prof.'")
    end
  end
end
