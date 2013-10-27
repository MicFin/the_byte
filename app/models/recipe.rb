class Recipe < ActiveRecord::Base
  belongs_to :cookbook
  delegate :company, :to => :employee, :allow_nil => true
  validates :name, presence: true
  # validates :ingredient_list, presence: true 
  # validates :link, presence: true 
  # add error  messagse for not valid inputs
end
