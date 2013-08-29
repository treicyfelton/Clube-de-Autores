#encoding: utf-8
class Admin::HistoriesController < ApplicationController
  respond_to :html
  before_filter :toIndex, only: [:index, :destroy]
  layout :selectlayout  
  
  def index
    @histories = History.all
    respond_with @histories
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
    redirect_to :back
  end
end