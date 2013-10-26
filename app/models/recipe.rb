class Recipe < ActiveRecord::Base
  has_many :orders
  has_many :cookbooks, through: :orders
  validates :name, presence: true
  # validates :ingredient_list, presence: true 
  # validates :link, presence: true 
  # add error  messagse for not valid inputs
end
