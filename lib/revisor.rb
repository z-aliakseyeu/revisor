require 'yaml'
require "benchmark"
require './lib/revisor/client'
#require './revisor/validator'
#require './revisor/notifier'

module Revisor
    class App
        def initialize(config_path)
            @config = YAML::load_file(config_path)
            @client = Revisor::Client.new(@config['client']['uri'])
        end 

        def execute
            exec_time = Benchmark.measure {
                @response = @client.request
            }

            [@response.code, exec_time]
        end
    end
end