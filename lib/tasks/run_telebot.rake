require 'telegram/bot'

task :run_telebot => :environment do
	token = '143595520:AAFsdggw9FE8baCiDSqs3PieNstpr0Bz_Zo'

	Telegram::Bot::Client.run(token) do |bot|
	  bot.listen do |message|
	    case message.text
	    when '/start'

	      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, the chat id: #{message.chat.id}")
	    when '/stop'
	      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
	    end
	  end
	end
end


 


task :telebot_send_single_message => :environment do
	token = Rails.application.secrets.telebot_token
	chat_id = Rails.application.secrets.chat_group_id
 
	Telegram::Bot::Client.run(token) do |bot|
 
      bot.api.send_message(chat_id: chat_id, text: "Yes biatch!! let's get this thing up")
 
	end
end

