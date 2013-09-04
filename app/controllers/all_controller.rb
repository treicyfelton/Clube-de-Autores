class AllController < ApplicationController
	layout :selectlayout
	before_filter :userLogged?, only: [:histories, :pending]
	before_filter :userModerator?, only: [:pending]
	before_filter :unmoderated, only: [:pending]

	def userModerator?
		redirect_to '/' if !session[:moderator]
	end

	def unmoderated
		History.where("moderate == 1").each do |h|
		  if DateTime.now > h.moderateTime + 1.days
		  	h.moderate = 0
		  	h.save
		  end
		end
	end
end