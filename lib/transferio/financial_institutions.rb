module TransferIO
  class FinancialInstitutions
    # This initializes our instance variables, and sets up a new Customer class.
    def initialize
      TransferIO::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", TransferIO.instance_variable_get(:"@#{key}"))
      end
    end

    def get
      @response = get('/financial_institutions', access_token)
      return parse_response(@response)
    end

    protected

    def parse_response(response)
      case response.code
      when 200
        @parsed_response = Hash.new
        @parsed_response[:code] = response.code
        response = JSON.parse(response)
        @parsed_response[:financial_institutions] = response["financial_institutions"]
        return @parsed_response
      else
        @parsed_response = Hash.new
        @parsed_response[:code] = response.code
        @parsed_response[:message] = response
        return @parsed_response
      end
    end

    private

    def get(path,options={})
      base_url = self.instance_variable_get(:'@base_url')

      url = base_url + path
      RestClient.get(url){ |response, request, result, &block|
          case response.code
          when 200
            response
          when 201
            response
          else
            response.return!(request, result, &block)
          end
      }
    end
  end
end
