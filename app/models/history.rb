# encoding: utf-8
class History < ActiveRecord::Base
	has_and_belongs_to_many :categories
	belongs_to :user
	belongs_to :classification
	has_many :favorites, :dependent => :destroy
	has_many :rates, :dependent => :destroy
  has_one :comic, :dependent=> :destroy

	attr_accessible :ahistory, :description, :note, :title, :category_ids, :classification_id, :user_id, :moderate, :historytype, :data_stream

	validates :title, presence: true, length: {maximum:70}
	validate :description, allow_blank: true, allow_nil: false
	validate :note, allow_blank: true, allow_nil: false
  validates :historytype, presence: true
  validates :category_ids, presence: true
  validates :classification_id, presence: true
  validates :user_id, presence: true

  def rate(user_id, urate)
    return false if rates.where(user_id: user_id).size>0 
    rates << Rate.create!(history_id: self.id, user_id: user_id, urate: urate, owner: self.user_id)
  end

  def favorite(user_id)
    return false if favorites.where(user_id: user_id).size>0 
    favorites << Favorite.create!(history_id: self.id, user_id: user_id)
  end

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ?', search_condition])
  end
end
