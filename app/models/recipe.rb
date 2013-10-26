class Recipe < ActiveRecord::Base
  belongs_to :cookbook
  validates :name, presence: true
  # validates :ingredient_list, presence: true 
  # validates :link, presence: true 
  # add error  messagse for not valid inputs
end
