class Classification < ActiveRecord::Base
  attr_accessible :min_age, :name
  has_many :histories

  validates :min_age, presence: true
  validates :name, presence: true
end

