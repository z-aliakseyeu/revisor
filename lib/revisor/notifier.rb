require "revisor/notification/email"
require "revisor/notification/sms"

module Revisor
    class Notifier
        
        def initialize(config)
            @notify_with = config["notify_with"]
            @transports = Hash.new
            @transports["email"] = Revisor::Notification::Email.new(config["transport"]["email"])
            @transports["sms"] = Revisor::Notification::Sms.new(config["transport"]["sms"])
        end

        def notify(message)
            @notify_with.each do |type|
                @transports[type].notify(message)
            end
        end

    end
end