# encoding: utf-8
class Admin::UsersController < ApplicationController

respond_to :html
before_filter :toIndex, only: [:index, :edit, :update, :destroy]
layout :selectlayout
  
  def index
    @users = User.all
    respond_with @users
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "Usuário atualizado com sucesso!" if @user.update_attributes(params[:user])
    @user.update_attribute(:admin, params[:admin]) if session[:admin]
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
end
