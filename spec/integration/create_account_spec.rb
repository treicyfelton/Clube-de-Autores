#encoding: utf-8

require 'spec_helper'

describe 'User' do

	describe 'create account' do

    before :each do
      @user = FactoryGirl.create(:user)

      visit '/users/new'
    	fill_in 'user_name', with: 'Name Test'
    	fill_in 'user_email', with: 'name@test.com'
    	fill_in 'user_nick', with: 'nametest'
    	fill_in 'user_plain_password', with: 'secret'
    	select '4', from: 'user_born_at_3i'
    	select 'Janeiro', from: 'user_born_at_2i'
    	select '2012', from: 'user_born_at_1i'
    	select 'Criando o tempo todo.', from: 'user_situation'
    	fill_in 'user_hobby', with: 'hobbies'
    end

    it 'should create a user' do
    	click_button 'Criar Usuário'
    	current_path.should eql '/users/2'
    end

    it 'should create a user with no hobby' do
    	fill_in 'user_hobby', with: ''
    	click_button 'Criar Usuário'
    	current_path.should eql '/users/2'
    end

    it 'should not create a user with no name' do
    	fill_in 'user_name', with: ''
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Nome não pode ficar em branco')
    end

    it 'should not create a user with no email' do
    	fill_in 'user_email', with: ''
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Email não pode ficar em branco')
    end

    it 'should not create a user with invalid email' do
    	fill_in 'user_email', with: 'email'
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Email não é válido')
    end

    it 'should not create a user with email in use' do
    	fill_in 'user_email', with: @user.email
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Email já está em uso')
    end

    it 'should not create a user with no pass' do
    	fill_in 'user_plain_password', with: ''
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Senha não pode ficar em branco')
    end

    it 'should not create a user with invalid pass' do
    	fill_in 'user_plain_password', with: 'pss'
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Tamanho de senha inválido!')
    end

    it 'should not create a user with no nick' do
    	fill_in 'user_nick', with: ''
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Nome de Usuário não pode ficar em branco')
    end

    it 'should not create a user with invalid nick' do
    	fill_in 'user_nick', with: '@nick#'
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Nome de Usuário não é válido')
    end

    it 'should not create a user with nick in use' do
    	fill_in 'user_nick', with: @user.nick
    	click_button 'Criar Usuário'
    	expect(page).to have_text('Nome de Usuário já está em uso')
    end
  end
end
