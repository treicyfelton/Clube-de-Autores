require 'spec_helper'

describe 'Login' do

  describe 'user account' do

    before :each do
      @user = FactoryGirl.create(:user)
    end

    it 'should login' do
      visit "/home"
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Entrar'
    end

    it 'should not login with wrong password' do
      visit entrar_path     
      fill_in 'email', with: @user.email
      fill_in 'password', with: 'aa'
      click_button 'Entrar'
      expect(page).to have_text("Falha no login")
    end

    it 'should not login with a blank password' do
      visit "/entrar"
      fill_in 'email', with: @user.email
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text("Informe a senha")
    end

    it 'should not login with wrong email' do
      visit "/entrar"
      fill_in 'email', with: 'voo@'
      fill_in 'password', with: @user.password
      click_button 'Entrar'
      expect(page).to have_text("Falha no login")
    end

    it 'should not login with a blank email' do
      visit "/entrar"
      fill_in 'email', with: ''
      fill_in 'password', with: @user.password
      click_button 'Entrar'
      expect(page).to have_text("Informe o email")
    end

    it 'should not login with a blank email and blank password' do
      visit "/entrar"
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text("Informe email e senha")
    end
  end
end