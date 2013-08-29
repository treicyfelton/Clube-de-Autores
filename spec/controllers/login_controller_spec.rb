require 'spec_helper'

describe LoginController do

  it 'should get login' do
    get :login
    response.should be_success
  end

  it "should not login without email and password" do
    post :login
    flash[:notice].should eql "Informe email e senha"
  end

  it "should not login without password" do
    post :login, {email: "foo@bar.com"}
    flash[:notice].should eql "Informe a senha"
  end

  it "should not login without email" do
    post :login, {password:"XXX"}
    flash[:notice].should eql "Informe o email"
  end

  it "should not login with invalid password" do
    user = FactoryGirl.build(:user)
    post :login, {email: user.email, password:"invalid"}
    flash[:notice].should eql "Falha no login"
  end

  it "should not login with invalid email" do
    post :login, {email: "foo@bar.com", password: "teste"}
    flash[:notice].should eql "Falha no login"
  end  

  context "user login" do
    it "should login with valid information" do
      user = FactoryGirl.create(:user, plain_password: "teste", admin: false)
      post :login, { email: user.email, password: "teste" }
      session[:id].should eql user.id
      session[:name].should eql user.name
      session[:admin].should eql user.admin?
      response.should redirect_to '/home'
    end
  end

  context "admin login" do
    it "should login with valid information" do
      user = FactoryGirl.create(:user, plain_password: "teste", admin: true)
      post :login, { email: user.email, password: "teste" }
      session[:id].should eql user.id
      session[:name].should eql user.name
      session[:admin].should eql user.admin?
    end

    it "redirect admin to admin/home" do
      user = FactoryGirl.create(:user, plain_password: "teste", admin: true)
      post :login, { email: user.email, password: "teste" }
      session[:id].should eql user.id
      session[:name].should eql user.name
      session[:admin].should eql user.admin?
      response.should redirect_to '/admin/home'
    end
  end

  it "should logout" do
    get :logout
    session[:id].should eql nil
    session[:name].should eql nil
    session[:admin].should eql nil
    expect(response).to redirect_to "/"
  end
end