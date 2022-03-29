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

  before_validation  :DOB_validated_before
  after_validation  :DOB_validated
  after_create  :show_create
  after_update  :show_update
  after_destroy :show_destroy, if: Proc.new{ |student| student.department == "IT"}
  after_save  :show_save

  after_initialize do |student|
    puts "==>You have initialized an object in Student!"
  end

  after_find do |student|
    puts "==>You have found an object in Student!"
  end

  private

  def show_create
    puts "==>Successfully created a record in Students"
  end

  def show_update
    puts "==>Successfully updated a record in Students"
  end

  def show_destroy
    puts "==>Successfully deleted a record in Students"
  end

  def show_save
    puts "==>Successfully saved changes in Students"
  end

  def DOB_validated
    puts "==>DOB validated Successfully in Students"
  end

  def DOB_validated_before
    puts "==>DOB validating in Students"
  end

end
