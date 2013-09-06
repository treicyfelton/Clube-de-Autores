require 'spec_helper'

describe HistoriesController do 

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @history = FactoryGirl.create(:history)
    @mh = FactoryGirl.create(:moderated_history)
    @rh = FactoryGirl.create(:refused_history)
  end
 
  describe 'show' do
    it "should redirect if not a moderated history" do
      get :show, id: @history
      response.should redirect_to "/"
    end

    it "should redirect if moderate history is 3" do
      get :show, id: @rh
      response.should redirect_to "/"
    end

    it "should redirect if moderate history is 0 and user not moderator" do
      get :show, id: @history
      response.should redirect_to "/"
    end

    it 'should show moderated history' do
      get :show, id: @mh
      response.should be_success
    end

    it 'renders the show view' do
      get :show, id: @mh
      response.should render_template :show
    end 

    
  end

  describe 'new' do
  	
  	it 'should not get new history' do
      get :new
      response.should_not be_success
    end

    it 'user should get new history' do
      login(@user)
      get :new
      response.should be_success
    end

    it 'admin should get new history' do
      login(@admin)
      get :new
      response.should be_success
    end

    it 'should create history' do
      login(@user)
      @new_history = History.new(@history.attributes.except("moderateTime", "id", "created_at","updated_at"))
      @new_history.title = "NewTitle"
      @new_history.ahistory = "hi"
      should_not eq('History.count') do
        post :create, history: { title: @history.title, ahistory: @history.ahistory }
      end
      response.should be_success
    end

    it 'should create history' do
      login(@user)
      @new_history = History.new(@history.attributes.except("moderateTime", "id", "created_at","updated_at"))
      @new_history.title = ""
      @new_history.ahistory = ""
      post :create, history: { title: @history.title, ahistory: @history.ahistory }
      response.should_not be_success
    end

    it 'renders the new view' do
      login(@user)
      get :new, id: @user
      response.should render_template :new
    end 

    it 'renders the new view for admin' do
      login(@admin)
      get :new, id: @user
      response.should render_template :new
    end 

    it 'not render the new view' do
      get :new, id: @user
      response.should_not render_template :new
    end 
  end

  describe 'edit' do

    it 'should update history' do
      login(@user)
      put :update, id: @history, history: { title: @history.title, ahistory: @history.ahistory }
      response.should redirect_to "/all/histories"
    end

    # it 'should update moderate' do
    #   login(@user)
    #   put :update, id: @mh, history: { title: @mh.title, moderate: @mh.moderate }
    #   p @mh.moderate
    #   (@mh.moderate).should eql 0
    # end
  end 

  describe 'delete' do

    it "redirects to all/histories" do
      login(@user)
      delete :destroy, id: @history 
      response.should redirect_to "/all/histories"
    end 

    it "user deletes the history" do
      login(@user)
      expect{ 
        delete :destroy, id: @history 
      }.to change(History,:count).by(-1) 
    end

    it "admin deletes the history" do
      login(@admin)
      expect{ 
        delete :destroy, id: @history 
      }.to change(History,:count).by(-1) 
    end
  end

  it 'notallow' do
    login(@admin)
    get :notallow, id: @mh
    response.should redirect_to "/all/pending"
  end
end
