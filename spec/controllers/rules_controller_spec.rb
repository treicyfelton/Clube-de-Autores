require 'spec_helper'

describe RulesController do 

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @rule = FactoryGirl.create(:rule)
  end
 
  describe 'show' do

    it 'should show rule' do
      get :show, id: @rule
      response.should be_success
    end

    it 'renders the show view' do
      get :show, id: @rule
      response.should render_template :show
    end 
  end

  describe 'edit' do

    it 'should update rule' do
      put :update, id: @rule, rule: { uprules: @rule.uprules }
      response.should_not be_success
    end

    it 'should update rule' do
      login(@user)
      put :update, id: @rule, rule: { uprules: @rule.uprules }
      response.should_not be_success
    end

    it 'should update rule' do
      login(@admin)
      put :update, id: @rule, rule: { uprules: @rule.uprules }
      response.should redirect_to rule_path
    end
  end
end