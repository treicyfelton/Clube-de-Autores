require 'spec_helper'

describe UsersController do 

  before :each do
    @user = FactoryGirl.create(:user)
  end
 
  describe 'show' do

    it 'should show user' do
      get :show, id: @user
      response.should be_success
    end

    it 'renders the show view' do
      get :show, id: @user
      response.should render_template :show
    end 
  end

  describe 'new' do
    
    it 'should get new' do
      get :new
      response.should be_success
    end

    it 'should create user' do
      @new_user = User.new(@user.attributes.except("id", "admin", "password", "created_at","updated_at"))
      @new_user.email = "functional@test.com"
      @new_user.nick = "novonick"
      should_not eq('User.count') do
        post :create, user: { born_at: @new_user.born_at, email: @new_user.email, hobby: @new_user.hobby, name: @new_user.name, nick: @new_user.nick, password: @new_user.password, situation: @new_user.situation }
      end
      response.should be_success
    end

    it 'renders the new view' do
      get :new, id: @user
      response.should render_template :new
    end 
  end

  describe 'edit' do

    it 'should redirect user' do
      login(@user)
      put :update, id: @user, user: { born_at: @user.born_at, email: @user.email, hobby: @user.hobby, name: @user.name, nick: @user.nick, situation: @user.situation }
      response.should redirect_to user_path
    end
  end
end