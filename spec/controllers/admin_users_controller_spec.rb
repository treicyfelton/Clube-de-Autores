require 'spec_helper'

describe Admin::UsersController do 

  before :each do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
  end

  describe 'get index' do

    it 'should get index' do
      login(@admin)
      get :new
      response.should be_success
    end

    it 'renders the index view' do
      controller.should_receive(:toIndex)
      get :index
      response.should render_template :index
    end 

    it 'should redirect visitant to index' do
      get :index
      response.should redirect_to root_url
    end

    it 'should redirect user to index' do
      get :index, id: @user, user: FactoryGirl.attributes_for(:user)
      response.should redirect_to root_url
    end

  end

  describe 'edit' do

    it 'admin should update user' do
      put :update, id: @user, user: { name: @user.name, admin: @user.admin }
      response.should redirect_to "/"
    end
  end


  describe 'delete' do

    it "redirects to users" do
      delete :destroy, id: @user 
      response.should redirect_to "/"
    end 

    it "deletes the user" do
      expect{ 
        delete :destroy, id: @user 
        }.to change(User,:count).by(0) 
    end
  end
end