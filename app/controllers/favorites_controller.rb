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

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
