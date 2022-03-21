class Student < ApplicationRecord
  validates :firstname,
            :lastname, 
            presence: true
  validate :birthdate_future
  validate :dept_valid
  validates :terms_of_usage,
            acceptance: {message: 'You cannot proceed without accepting Terms of Usage'}

  def birthdate_future
    if (self.DOB.present?) && (self.DOB > Date.today)
      errors.add(:DOB, "birthdate can't be in future")
    end
  end 
  
  def dept_valid
    if department.casecmp("IT") == 0 || department.casecmp("CE") == 0 
    else
      errors.add(:department, "can't be #{department}")
    end
  end
end
