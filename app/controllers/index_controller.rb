class IndexController < ApplicationController
	respond_to :html
	layout :selectlayout

	def tops
		topAuthors
		topHistories
		last
		respond_with @top, @top_id, @topauthors, @topauthors_nick, @lastUser, @lastHistory
	end

	def topHistories
		@top = History.joins(:rates).group("histories.id").order("sum(rates.urate) desc").limit(10).sum("rates.urate").map {|k,v| History.find(k).title}
	    @top_id = History.joins(:rates).group("histories.id").order("sum(rates.urate) desc").limit(10).sum("rates.urate").map {|k,v| History.find(k).id}
	end


  def topAuthors
  	@topauthors = History.joins(:rates).group("histories.user_id").order("sum(rates.urate) desc").limit(10).sum("rates.urate").map {|k,v| User.find(k).name}
    @topauthors_nick = History.joins(:rates).group("histories.user_id").order("sum(rates.urate) desc").limit(10).sum("rates.urate").map {|k,v| User.find(k).nick}
  end

  def last
  	@lastUser = User.last
  	@lastHistory = History.last
  end

  def index
		tops
  end
end
