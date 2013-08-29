class CategoriesController < ApplicationController

  before_filter :userlogged?, :only => [:edit, :new, :index]
  layout :selectlayout

  def histories
    @category = Category.find(params[:id])
    @histories = @category.histories.page(params[:page]).per(3)
  end
end
