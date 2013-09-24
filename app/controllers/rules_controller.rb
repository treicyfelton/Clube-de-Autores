class RulesController < ApplicationController

  before_filter :logged?, :only => [:edit, :index, :new]
  before_filter :adminlogged?, :only => [:new, :index]
  layout :selectlayout
  
  def adminlogged?
    if session[:id] && session[:admin]
      redirect_to "/rules/1"
    end
  end

  def show
    @rule = Rule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rule }
    end
  end

  def update
    @rule = Rule.find(params[:id])

    respond_to do |format|
      if @rule.update_attributes(params[:rule])
        format.html { redirect_to @rule, notice: 'Regras atualizadas!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end
end
