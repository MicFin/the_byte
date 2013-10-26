class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, through: :orders
  validates :name, presence: true
  # add error  messagse for not valid inputs
end
