class Diet < ActiveRecord::Base
  has_and_belongs_to_many :members
  validates :name, presence: true
end
