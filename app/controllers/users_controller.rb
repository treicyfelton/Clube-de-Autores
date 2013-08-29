# encoding: utf-8
class UsersController < ApplicationController

respond_to :html
before_filter :userLogged?, only: [:edit, :update, :destroy]
layout :selectlayout

  def show
    @user = params[:id] =~ /^\d+$/ ? User.find(params[:id]) : User.where(nick: params[:id]).first rescue nil
    if @user
      @histories = @user.histories
      respond_with @user, @history
    else
      redirect_to "/"
    end
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
    if session[:id] == @user.id
      respond_with @user
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with @user
  rescue => error
    flash[:notice] = error.to_s
    @user = User.new(params[:user].except(:plain_password))
    render :new 
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_path
  rescue => error
    flash[:notice] = error.to_s
    @user.update_attributes(params[:user].except(:plain_password))
    render :edit 
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "Usuário deletado com sucesso!" if @user.destroy
    respond_with @user
  end
end