class Lead < ActiveRecord::Base


 

    validate :phone_must_be_present , :valid_selected_product

    def phone_must_be_present
        if not phone_number.present?
          self.errors.add(:phone_number, "Nomor telpon harus ada")
          return self 
        end
    end
      
    def valid_selected_product
        if not  ["1" , "2", "3"].include?( selected_product )
          self.errors.add(:selected_product, "Salah selected product")
          return self 
        end
    end

	def self.create_object( params )
		new_object  = self.new 

		new_object.name = params[:name]
    	new_object.email = params[:email]
   		 new_object.selected_product = params[:selected_product]
		new_object.phone_number = params[:phone_number]
		new_object.age = params[:age]
		new_object.address = params[:address]
		new_object.booking_date = params[:booking_date]

		new_object.selected_product = params[:selected_product]

		new_object.save

		return new_object 
	end
end
