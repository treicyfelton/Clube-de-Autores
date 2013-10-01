class CategoriesController < ApplicationController

  before_filter :userlogged?, :only => [:edit, :new, :index]
  layout :selectlayout

  def histories
    @category = Category.find(params[:id])
    @histories = @category.histories.where("moderate = 2").page(params[:page]).per(20)
  end
end
