#encoding: utf-8

require 'spec_helper'

describe 'History' do

	describe 'create history' do

		before :each do
      @user = FactoryGirl.create(:user)

      visit '/entrar'
      fill_in 'email', with: @user.email
      fill_in 'password', with: '123456'
      click_button 'Entrar'

      visit '/histories/new'
      select 'História', from: 'history_historytype'
    	fill_in 'history_title', with: 'title'
    	fill_in 'history_description', with: 'description'
    	fill_in 'history_note', with: 'note'
    	select 'Livre', from: 'history_classification_id'
    	select 'Amor', from: 'history_category_ids'
    	fill_in '1', with: 'history'
    end

    xit 'should create a history' do
    	click_button 'Criar História'
    	p current_path  
    	current_path.should eql '/users/2'  	
    end
	end
end