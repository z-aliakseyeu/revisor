require "yaml"
require "benchmark"
require "revisor/client"
require "revisor/validator"
require "revisor/version"
require "revisor/notifier"

module Revisor
    class App
        def initialize(config_path)
            @config = YAML::load_file(config_path)
            @client = Revisor::Client.new(@config['client'])
            @validator  = Revisor::Validator.new(@config['validator'])
            @notifier = Revisor::Notifier.new(@config['notifier'])
        end 

        def execute
            exec_time = Benchmark.measure {
                @response = @client.request
            }

            if !validator.is_valid(@response, exec_time)
                @notifier.notify "some errors occured"
            end
        end
    end
end
