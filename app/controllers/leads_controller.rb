class HomeController < ApplicationController


	def create
		object = Lead.create_object( params[:lead])
	end
end
