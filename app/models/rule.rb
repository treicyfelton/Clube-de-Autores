class Rule < ActiveRecord::Base
  attr_accessible :uprules

  validates :uprules, presence: true
end
