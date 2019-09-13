class School < ApplicationRecord
  # Validations
  
  # Associations
  has_many :students, dependent: :destroy
end
