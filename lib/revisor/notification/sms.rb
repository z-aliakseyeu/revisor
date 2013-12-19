require 'nexmo'

module Revisor
    module Notification
        class Sms

            def initialize(config)
                @client = Nexmo::Client.new(config["api_key"], config["api_secret"])
                @phone_number = config["phone_number"]
                @from = config["from"]
            end

            def notify(body)
                response = @client.send_message({:to => @phone_number, :from => @from, :text => body})

                if !response.ok?
                    puts "Sms sending is broken"
                    # here must be logger if we talk about good practices
                end
            end
        end
    end
end