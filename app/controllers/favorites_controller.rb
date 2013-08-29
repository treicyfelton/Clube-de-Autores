class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
  end

  def create
    current_user.favorites.create(:history_id => params[:history_id])
    render :layout => false
  end
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    if session[:admin]
      redirect_to "/admin/home"
    else
      redirect_to "home"
    end
  end
end
