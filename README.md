# Capistrano - Telegram Notification

Send notifications to Telegram about Capistrano deployments.

## Installation

1. Add this line to your application's `Gemfile`:

   ```ruby
   gem 'capistrano-telegram'
   ```

2. Execute:

   ```
   $ bundle
   ```

3. Require the library in your application's `Capfile`:

   ```ruby
   require 'capistrano/telegram'
   ```

## Prerequisites
1. Create a new bot (refer to the official Telegram guide [here](https://core.telegram.org/bots)) and take note of the token generated.

2. Include your bot in the desired chat

3. To get the `chat_id`, go to: ht<span>tps://</span>api.telegram.org/bot**YOUR_BOT_TOKEN**/getUpdates


## Configuration

1. Add these lines to your application's `config/deploy.rb` file:

   ```ruby
   set :telegram_bot_key, 'YOUR_BOT_ID'
   set :telegram_chat_id, 'YOUR_BOT_CHAT_ID'
   ```
