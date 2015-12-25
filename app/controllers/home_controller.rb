class HomeController < ApplicationController
	def index
		@lead = Lead.new 

		@products = {
			"1" => "Private BodyGuard",
			"2" => "Driver",
			"3" => "Private BodyGuard + Driver",


		}
 

		@default_product  = "1"
	end

	def post_order
 
	

	end
end
