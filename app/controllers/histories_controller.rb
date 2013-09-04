#encoding: utf-8
class HistoriesController < ApplicationController
  respond_to :html
  before_filter :toIndex, only: [:index]
  before_filter :userLogged?, only: [:new, :create, :edit, :update, :destroy, :rate, :favoriteChecked]
  before_filter :load_classifications, only: [:new, :edit, :update, :create]
  layout :selectlayout  
  
  def index
    @histories = History.all
    respond_with @histories
  end

  def show
    @history = History.find(params[:id]) rescue nil
    if !@history 
      redirect_to "/"
      return
    end

    if @history .moderate == 3
      redirect_to "/"
      return
    end

    if @history.moderate == 0 && !session[:moderator]
      redirect_to "/"
      return
    else
      if @history.moderate == 0 && session[:moderator]
        @history.moderate = 1
        @history.save
        @history.moderateTime = @history.updated_at
        @history.updated_at = @history.created_at
        @history.save
      end
    end

    if session[:id]
      @user = User.find(session[:id])
      if !@user || !@user.allowed_history(@history)
        redirect_to "/"
        return
      end
    end
    respond_with @history
  end

  def new
    @history = History.new
    respond_with @history
  end

  def edit
    @history = History.find(params[:id])
    return if !check_if_allowed(@history)
    respond_with @history
  end

  def currentUser
    User.find(session[:id])
  end

  def create
    @history = currentUser.histories.new(params[:history])
    @history.moderate = 0
    @history.save
    flash[:notice] = "História criada com sucesso, aguarde aprovação."
    redirect_to "/all/histories"
  end

  def update
    params[:history][:category_ids] ||= []
    @history = History.find(params[:id])
    @history.moderate = 0
    @history.update_attributes(params[:history])
    respond_with @history
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
    redirect_to "/all/histories"
  end

  def rate
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    @history = History.find(params[:history]) rescue nil
    if !@history
      redirect_to "/"
      return
    end
    p "nao passou pelo if, tem que criar novo voto"
    @history.rate(session[:id],params[:rate].to_i)
    p "finalizou o modelo"
    render :text => "#{params[:rate]}"
  end

  def favoriteChecked
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    @history = History.find(params[:h]) rescue nil
    if !@history
      redirect_to "/"
      return
    end
    p "nao passou pelo if, tem que criar novo fav"
    @history.favorite(session[:id])
    p "finalizou o modelo"
    render :text => "#{params[:favoriteChecked]}"
  end

  def moderation
    @history = History.find(params[:id])
    @history.moderate = 2
    @history.save
    flash[:notice] = "História moderada e publicada com sucesso!"
    redirect_to "/all/pending"
  end

  def notallow
    @history = History.find(params[:id])
    @history.moderate = 3
    @history.save
    flash[:notice] = "História moderada. História não publicada."
    redirect_to "/all/pending"
  end

  private
  def load_classifications
    @classifications = Classification.all
  end
end
