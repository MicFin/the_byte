class Member < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :allergies
  has_and_belongs_to_many :diets
  has_and_belongs_to_many :excludedingredients
end
