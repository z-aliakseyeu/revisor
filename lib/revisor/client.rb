require 'net/http'

module Revisor
    class Client

        def initialize(config)
            @uri = URI.parse(config['uri'])
        end

        # ! only head request, because we have no need to check content in body
        def request
            Net::HTTP.start(@uri.host, @uri.port) do |http|
                http.head('/')
            end
        end

    end
end