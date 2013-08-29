require 'spec_helper'

describe 'User' do

  describe 'login' do

    it 'should not login with wrong pass' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: 'aa'
      click_button 'Entrar'
      expect(page).to have_text("Fail to Login")
    end

    it 'should not login with wrong email' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'email', with: 'voo@'
      fill_in 'password', with: user.password
      click_button 'Entrar'
      expect(page).to have_text("Fail to Login")
    end

    it 'should login' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Entrar'
    end
  end

end