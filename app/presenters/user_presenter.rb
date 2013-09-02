# encoding: utf-8

class UserPresenter
	delegate :id, :name, :email, :nick, :situation, :hobby, to: :"@user"

	def initialize(user)
		@user = user
	end

	def admin
		@user.admin ? "Sim" : "Não"
	end

	def moderator
		@user.moderator ? "Sim" : "Não"
	end

	def born_at
		I18n.l(@user.born_at)
	end

	def password
		"*"*10
	end

	def to_s
		@user.id
	end

	private
		def helpers
			ApplicationController.helpers
		end
end