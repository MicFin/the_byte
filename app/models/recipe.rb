class Recipe < ActiveRecord::Base
  belongs_to :cook
  has_and_belongs_to_many :allergies
  has_and_belongs_to_many :diets
  validates :name, presence: true
  validates :age, presence: true 
  # add error  messagse for not valid inputs
end
