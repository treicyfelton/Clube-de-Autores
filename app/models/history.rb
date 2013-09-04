# encoding: utf-8
class History < ActiveRecord::Base
	has_and_belongs_to_many :categories
	belongs_to :user
	belongs_to :classification
	has_many :favorites, :dependent => :destroy
	has_many :rates, :dependent => :destroy

	attr_accessible :ahistory, :description, :note, :title, :category_ids, :classification_id, :user_id, :moderate

	validates :title, presence: true, length: {maximum:70}
	validate :description, allow_blank: true, allow_nil: false
	validate :note, allow_blank: true, allow_nil: false
	validates :ahistory, presence: true

  def rate(user_id, urate)
  	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  	p "cheguei no modelo"
    return false if rates.where(user_id: user_id).size>0 
    rates << Rate.create!(history_id: self.id, user_id: user_id, urate: urate, owner: self.user_id)
  end

  def favorite(user_id)
  	p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  	p "cheguei no modelo"
    return false if favorites.where(user_id: user_id).size>0 
    favorites << Favorite.create!(history_id: self.id, user_id: user_id)
  end
end
