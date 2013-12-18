#require 'revisor/client'
#require 'revisor/validator'
#require 'revisor/notifier'
require 'yaml'

module Revisor
    class App
        def initialize(configuration_path)
            @configuration = YAML::load_file(configuration_path)
        end 

        def execute

            puts @configuration

        end
    end
end