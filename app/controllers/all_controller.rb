class AllController < ApplicationController
	layout :selectlayout
	before_filter :userLogged?, only: [:histories, :pending]
	before_filter :userModerator?, only: [:pending]

	def userModerator?
		redirect_to '/' if !session[:moderator]
	end

	def unmoderated
		
	end
end
