# encoding: utf-8
class Category < ActiveRecord::Base
  attr_accessible :addcategory
  has_and_belongs_to_many :histories	
  accepts_nested_attributes_for :histories, allow_destroy: true
  
  default_scope order("addcategory")
  	validates :addcategory, presence: true, length: {maximum:30}

end
