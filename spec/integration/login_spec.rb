require 'spec_helper'

describe 'Login' do

  describe 'user login' do

    before :each do
      @user = FactoryGirl.create(:user)

      visit '/entrar'
      fill_in 'email', with: @user.email
      fill_in 'password', with: '123456'
    end

    it 'should login' do
      click_button 'Entrar'
      current_path.should eql '/home'
    end

    it 'should not login with wrong password' do
      fill_in 'password', with: 'aa'
      click_button 'Entrar'
      expect(page).to have_text('Falha no login')
    end

    it 'should not login with a blank password' do
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text('Informe a senha')
    end

    it 'should not login with wrong email' do
      fill_in 'email', with: 'voo@'
      click_button 'Entrar'
      expect(page).to have_text('Falha no login')
    end

    it 'should not login with a blank email' do
      fill_in 'email', with: ''
      click_button 'Entrar'
      expect(page).to have_text('Informe o email')
    end

    it 'should not login with a blank email and blank password' do
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      click_button 'Entrar'
      expect(page).to have_text('Informe email e senha')
    end
  end

  describe 'user loggout' do

    before :each do
      @user = FactoryGirl.create(:user)

      visit '/entrar'
      fill_in 'email', with: @user.email
      fill_in 'password', with: '123456'
      click_button 'Entrar'
    end

    it 'should loggout a user' do
      click_link 'Sair?'
      visit '/home'
      current_path.should eql '/entrar'
    end
  end
end