class HomeController < ApplicationController
	respond_to :html 
	before_filter :userLogged?	
	before_filter :responds
	layout :selectlayout

	def responds
    updateHistories
    favoriteHistories
    respond_with @upHistories, @upHistoriesId, @favHistories, @favId, @hId
  end

History.joins(:rates).group("histories.user_id").order("sum(rates.urate) desc").limit(10).sum("rates.urate").map {|k,v| User.find(k).name}

  def updateHistories
    @upHistories ||= []
    @upHistoriesId ||= []
    Favorite.where("user_id = #{session[:id]}").each do |r|
      @a = History.find(r.history_id)
      if @a.updateHistory > @a.created_at
        @upHistories << @a.title
        @upHistoriesId << @a.id
      end
    end
  end

  def favoriteHistories
    @favHistories ||= []
    @favId ||= []
    @hId ||= []
    Favorite.where("user_id = #{session[:id]}").each do |f|
      @b = History.find(f.history_id)
      @favHistories << @b.title
      @hId << @b.id
      @favId << f.id
    end
  end
end
