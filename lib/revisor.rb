require "yaml"
require "benchmark"
require "revisor/client"
require "revisor/validator"
require "revisor/notifier"
require "revisor/version"

module Revisor
    class App
        def initialize(config_path)
            @config = YAML::load_file(config_path)

            @client = Revisor::Client.new(@config['client'])
            @validator  = Revisor::Validator.new(@config['validator'])
            @notifier = Revisor::Notifier.new(@config['notifier'])

            @notify_on_failures = @config["revisor"]["notify_on_failures"]
            @failures = 0
        end 

        def execute
            exec_time = Benchmark.measure do
                @response = @client.request
            end

            if !@validator.is_valid(@response, exec_time)
                @failures += 1
                if (@failures == @notify_on_failures)
                    @notifier.notify @validator.get_message
                end
            else
                if (@failures >= @notify_on_failures)
                    @failures = 0
                    @notifier.notify "Your site is works again perfectly."
                end
            end
        end
    end
end
