class Cookbook < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  # add error  messagse for not valid inputs
end
