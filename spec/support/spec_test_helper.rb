module SpecTestHelper

  def login(user)
    user = User.find(user.id)
    request.session[:id] = user.id
    request.session[:admin] = user.admin
  end

  def current_user
    User.find(request.session[:user])
  end
end