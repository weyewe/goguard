
class LeadsController < ApplicationController


	def create
		object = Lead.create_object( params[:lead])


		puts "The error notification"
		puts "\n"*5
		object.errors.messages.each {|x| puts "The msg: #{x}"}

		redirect_to finish_application_url
	end
end
