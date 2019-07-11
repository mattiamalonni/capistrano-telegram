# Capistrano - Telegram Notification

Send notifications to Telegram about Capistrano deployments.

## Installation

1. Add this line to your application's Gemfile:

   ```ruby
   gem 'capistrano-telegram'
   ```

2. Execute:

   ```
   $ bundle
   ```

3. Require the library in your application's Capfile:

   ```ruby
   require 'capistrano/telegram'
   ```

### config/deploy.rb

```ruby
set :telegram_bot_key, 'YOUR_BOT_ID'
set :telegram_chat_id, 'YOUR_BOT_CHAT_ID'
```
