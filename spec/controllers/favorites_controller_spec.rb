require 'spec_helper'

describe FavoritesController do 

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @favorite = FactoryGirl.create(:favorite)
  end
 
  describe 'new' do
  	
  	it 'should create favorite' do
      login(@user)
      @new_favorite = Favorite.new(@favorite.attributes.except("id", "created_at","updated_at"))
      @new_favorite.history_id = 2
      @new_favorite.user_id = 11
      should_not eq('Favorite.count') do
        post :create, favorite: { history_id: @favorite.history_id, user_id: @favorite.user_id }
      end
      response.should be_success
    end

    it 'should create favorite' do
      login(@admin)
      @new_favorite = Favorite.new(@favorite.attributes.except("id", "created_at","updated_at"))
      @new_favorite.history_id = 2
      @new_favorite.user_id = 11
      should_not eq('Favorite.count') do
        post :create, favorite: { history_id: @favorite.history_id, user_id: @favorite.user_id }
      end
      response.should be_success
    end
  end

  describe 'delete' do

    it "user deletes the favorite" do
      login(@user)
      expect{ 
        delete :destroy, id: @favorite 
      }.to change(Favorite,:count).by(-1) 
    end

    it "admin deletes the favorite" do
      login(@admin)
      expect{ 
        delete :destroy, id: @favorite 
      }.to change(Favorite,:count).by(-1) 
    end
  end
end