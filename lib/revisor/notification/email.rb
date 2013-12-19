require 'mail'

module Revisor
    module Notification
        class Email
            def initialize(config)
                @from, @to, @subject = config["from"], config["to"], config["subject"]
            end

            def notify(body)
                mail = get_message body
                mail.delivery_method :sendmail

                mail.deliver
            end

            def get_message(body)
                mail = Mail.new
                mail.from = @from
                mail.to = @to
                mail.subject = @subject
                mail.body = body

                mail
            end

            private :get_message
        end
    end
end