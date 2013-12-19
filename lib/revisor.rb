require "yaml"
require "benchmark"
require "revisor/client"
require "revisor/validator"
require "revisor/version"
# require "revisor/notifier"

module Revisor
    class App
        def initialize(config_path)
            @config = YAML::load_file(config_path)
            @client = Revisor::Client.new(@config['client'])
            @validator  = Revisor::Validator.new(@config['validator'])
        end 

        def execute
            exec_time = Benchmark.measure {
                @response = @client.request
            }

            @validator.is_valid(@response, exec_time)
        end
    end
end
