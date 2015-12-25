require 'telegram/bot'


class Lead < ActiveRecord::Base


 

    validate :phone_must_be_present , :valid_selected_product

    def phone_must_be_present
        if not phone_number.present?
          self.errors.add(:phone_number, "Nomor telpon harus ada")
          return self 
        end
    end
      
    def valid_selected_product
        if not selected_product.present?
          self.errors.add(:selected_product, "Selected product harus dipilih")
          return self 
        end


        if not  ["1" , "2", "3"].include?( selected_product.to_s )
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

    if new_object.save
      token = Rails.application.secrets.telebot_token
      chat_id = Rails.application.secrets.chat_group_id
     
      Telegram::Bot::Client.run(token) do |bot|

        msg =  "" 
        msg <<  "OrderID: #{new_object.id}" + "\n\n" 

        msg << "Nama: " + new_object.name + "\n" 
        msg << "No Telp: " + new_object.phone_number + "\n" 
        msg << "Umur: " + new_object.age.to_s + "\n"

        msg << "Alamat: " + new_object.address + "\n"


        msg << "\n\nProduct: "
        if params[:selected_product].to_i == 1 
          msg <<  "Private bodyguard" + "\n"
        elsif params[:selected_product].to_i == 2 
          msg <<  "Driver" + "\n"
        elsif params[:selected_product].to_i == 3 
          msg <<  "Private bodyguard + Driver" + "\n"
        end 

        msg << "Tgl Booking: " + new_object.booking_date + "\n"


     
          bot.api.send_message(chat_id: chat_id, text: msg )
     
      end
    end

		return new_object 
	end
end
