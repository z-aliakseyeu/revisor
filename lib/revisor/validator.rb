module Revisor
    class Validator

        def initialize(config)
            @valid_codes, @min_time = config['codes'], config['min_time'].to_f
        end

        def is_valid(response, time)
            valid = false
            @message = nil

            case false
                when @valid_codes.include?(response.code.to_i)
                    @message = "The response is not valid."
                when time.real < @min_time
                    @message = "Response time is large than minimal allowed."
                else
                    valid = true
            end
            
            valid
        end

        def get_message
            @message
        end
    end
end