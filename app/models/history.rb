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
end
