#encoding: utf-8
class HistoriesController < ApplicationController
  respond_to :html
  before_filter :toIndex, only: [:index]
  before_filter :userLogged?, only: [:new, :create, :edit, :update, :destroy]
  before_filter :load_classifications, only: [:new, :edit, :update, :create]
  layout :selectlayout  
  
  def index
    @histories = History.all
    respond_with @histories
  end

  def show
    @history = History.find(params[:id]) rescue nil
    if @history
      if session[:id]
        @user = User.find(session[:id])
        if !@user.allowed_history(@history)
          redirect_to "/"
          return
        else
          respond_with @history
        end
      end
    else
      redirect_to "/"
    end
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
    @history.save
    respond_with @history
  end

  def update
    params[:history][:category_ids] ||= []
    @history = History.find(params[:id])
    flash[:notice] = "História atualizada!" if @history.update_attributes(params[:history])
    respond_with @history
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
    redirect_to "/all/histories"
  end

  

  def rate
    if session[:id]
      @newrate = params[:rate]
      @newhistory = params[:history]
      @rating = Rate.new
      @rating.user_id = session[:id]
      @rating.urate = @newrate.to_i
      @rating.history_id = @newhistory.to_i
      @h = History.find(@newhistory)
      @rating.owner = @h.user_id
      voted?
      if @a == 1
        @rating.save
      end
    else
      redirect_to "/entrar"
    end
    render :text => "#{params[:rate]}"
  end

  def voted?
    @a = []
    @a = Rate.where("history_id == #{@newhistory}").where("user_id == #{session[:id]}")
    if @a == []
      @a = 1
    else
      if @a != []
        @a = 0
      end
    end
  end


  def favoriteChecked
    @newcheck = params[:op]
    @newh = params[:h]
    @faved = Favorite.new
    @faved.user_id = session[:id]
    @faved.history_id = @newh.to_i
    faved?
    if @b == 1
      @faved.save
    end
    render :text => "#{params[:favoriteChecked]}"
  end

  def faved?
    @b ||= []
    @b = Favorite.where("history_id == #{@newh}").where("user_id == #{session[:id]}")
    if @b == []
      @b = 1
    else
      if @b != []
        @b = 0
      end
    end
  end

  private
  def load_classifications
    @classifications = Classification.all
  end
end
