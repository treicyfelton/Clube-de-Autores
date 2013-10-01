class LoginController < ApplicationController
  layout :selectlayout
	
	  
  def login
 	if request.post?
		email= params[:email]
		password = params[:password]
		admin = params[:admin]
		moderator = params[:moderator]
	end

	if email.blank? && password.blank?
		flash.now.alert = "Informe email e senha"
		return
	end

	if email.blank?
		flash[:notice] = "Informe o email"
		return
	end

	if password.blank?
		flash[:notice] = "Informe a senha"
		return
	end

	user = User.auth(email,password)
	if !user
		flash[:notice] = "Falha no login"
		return
	end

	session[:id] = user.id
	session[:name] = user.name
	session[:admin] = user.admin
	session[:moderator] = user.moderator
	if session[:admin] == true
	  redirect_to "/admin/home"
	else
		redirect_to home_path 
	end
  end


  def logout
  	session[:id] = nil
	session[:name] = nil
	session[:admin] = nil
	session[:moderator] = nil
	redirect_to "/"
  end
end
