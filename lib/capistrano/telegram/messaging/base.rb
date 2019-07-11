require_relative 'helpers'

module Capistrano
  module Telegram
    module Messaging
      class Base
        include Helpers

        def payload_for_updating
          {
            text: "#{deployer} has started deploying branch #{branch} of #{application} to #{stage}"
          }
        end
  
        def payload_for_reverting
          {
            text: "#{deployer} has started rolling back branch #{branch} of #{application} to #{stage}"
          }
        end
  
        def payload_for_updated
          {
            text: "#{deployer} has finished deploying branch #{branch} of #{application} to #{stage}"
          }
        end
  
        def payload_for_reverted
          {
            text: "#{deployer} has finished rolling back branch of #{application} to #{stage}"
          }
        end
  
        def payload_for_failed
          {
            text: "#{deployer} has failed to #{deploying? ? 'deploy' : 'rollback'} branch #{branch} of #{application} to #{stage}"
          }
        end
  
        def payload_for(action)
          method = "payload_for_#{action}"
          respond_to?(method) && send(method)
        end
  
      end
    end    
  end
end