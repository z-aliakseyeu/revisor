module Revisor
    class Validator

        def initialize(config)
            @valid_codes, @min_time = config['codes'], config['min_time'].to_f
        end

        def is_valid(response, time)
            valid = false
            
            # checking for valid response time and code in one if... not the best solution
            if time.real < @min_time && @valid_codes.include?(response.code.to_i)
                valid = true
            end
            
            valid
        end
    end
end