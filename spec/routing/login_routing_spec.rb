require 'spec_helper'


describe LoginController do

	it 'should have login' do
    get('/entrar').should route_to('login#login')
  end

  it 'should have index' do
    get('/sair').should route_to('login#logout')
  end

end