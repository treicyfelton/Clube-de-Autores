module HistoriesHelper
	def category_collection
		Category.all.map{ |r| [r.addcategory, r.id] }
	end
end
