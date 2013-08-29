class Admin::RulesController < ApplicationController

  before_filter :toIndex
  layout :selectlayout

  def show
    @rule = Rule.find(params[:id])
  end

  def edit
    @rule = Rule.find(params[:id])
  end
end