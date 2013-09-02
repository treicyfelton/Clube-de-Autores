require 'spec_helper'


describe IndexController do

	it 'should have root' do
    get('/').should route_to('index#index')
  end

  it 'should have index' do
    get('/index').should route_to('index#index')
  end

end