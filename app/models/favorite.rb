class Favorite < ActiveRecord::Base
  attr_accessible :history_id, :user_id
  belongs_to :user
  belongs_to :history

  validates :history_id, presence: true
  validates :user_id, presence: true
end
