require_relative 'telegram/messaging/base'

require 'telegram/bot'

load File.expand_path('../tasks/telegram.rake', __FILE__)

module Capistrano
  class Telegram
    
    def initialize(env)
      @telegram_bot_key = fetch(:telegram_bot_key, nil)
      @telegram_chat_id = fetch(:telegram_chat_id, nil)
      @message = Capistrano::Telegram::Messaging::Base.new
    end

    def send(action)
      payload = @message.payload_for(action)
      send_to_telegram(payload)
    end

    private 
    def send_to_telegram(message)
      Telegram::Bot::Client.run(@telegram_bot_key) do |bot|
        bot.api.send_message(chat_id: @telegram_chat_id, text: message)
      end
    end
  
  end
end