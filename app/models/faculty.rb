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

  after_validation  :DOB_validated
  after_create  :show_create
  after_update  :show_update
  after_destroy :show_destroy
  after_save  :show_save
  after_validation :show_Email_validated

  private

  after_initialize do |faculty|
    puts "==>You have initialized an object in Faculty!"
  end

  after_find do |faculty|
    puts "==>You have found an object in faculty!"
  end

  def show_create
    puts "==>Successfully created a record in Faculties"
  end

  def show_update
    puts "==>Successfully updated a record in Faculties"
  end

  def show_destroy
    puts "==>Successfully deleted a record in Faculties"
  end

  def show_save
    puts "==>Successfully saved changes in Faculties"
  end

  def show_Email_validated
    puts "==>Email validted Successfully in Faculties"
  end

  def DOB_validated
    puts "==>DOB validated Successfully in Faculties"
  end
end
