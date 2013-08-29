module SpecTestHelper

  def login(user)
    user = User.find(user.id)
    session[:id] = user.id
    session[:admin] = user.admin
  end

  def current_user
    User.find(request.session[:user])
  end
end