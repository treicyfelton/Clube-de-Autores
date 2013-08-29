class Rate < ActiveRecord::Base
  attr_accessible :history_id, :urate, :user_id, :owner
  belongs_to :history
  belongs_to :user

  validates :history_id, presence: true
  validates :urate, presence: true
  validates :user_id, presence: true
  validates :owner, presence: true
end
