class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_if_allowed(history)
    if history.user.id != session[:id]
      redirect_to "/histories"
      return false
    end
    true
  end

  def selectlayout
    if session[:admin]
      "admin"
    else
      if session[:id] && !session[:admin]
      "user"
      else
        if !session[:id]
        "pub"
        end
      end
    end
  end

  def toIndex
    if !session[:id]
      redirect_to "/" 
    else
      if session[:id] && !session[:admin]
        redirect_to "/"
      end
    end
  end

  def toLogin
    if !session[:id]
      redirect_to "/entrar" 
    else
      if session[:id] && !session[:admin]
        redirect_to "/entrar"
      end
    end
  end

  def userLogged?
    if !session[:id]
      redirect_to "/entrar"
    end
  end  
end