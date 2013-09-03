class AllController < ApplicationController
	layout :selectlayout
	before_filter :userLogged?, only: [:histories]
end
