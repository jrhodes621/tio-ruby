module TransferIO
  class Customers
    # This initializes our instance variables, and sets up a new Customer class.
    def initialize
      TransferIO::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", TransferIO.instance_variable_get(:"@#{key}"))
      end
    end

    def create first_name, last_name, email, ip_address

      @response = post("/customers", {
        first_name: first_name,
        last_name: last_name,
        email: email,
        ip_address: ip_address
      })

      return parse_response(@response)
    end

    protected

    def parse_response(response)
      case response.code
      when 200
        @parsed_response = Hash.new
        @parsed_response[:code] = response.code
        response = JSON.parse(response)
        @parsed_response[:customer_id] = response["id"]
        @parsed_response[:first_name] = response["first_name"]
        @parsed_response[:last_name] = response["last_name"]
        @parsed_response[:email] = response["email"]
        @parsed_response[:created_at] = response["created_at"]
        @parsed_response[:updated_at] = response["updated_at"]
        return @parsed_response
      when 201
        @parsed_response = Hash.new
        @parsed_response[:code] = response.code
        response = JSON.parse(response)
        @parsed_response[:customer_id] = response["id"]
        @parsed_response[:first_name] = response["first_name"]
        @parsed_response[:last_name] = response["last_name"]
        @parsed_response[:email] = response["email"]
        @parsed_response[:created_at] = response["created_at"]
        @parsed_response[:updated_at] = response["updated_at"]
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
      RestClient.get(url,:params => {:client_id => self.instance_variable_get(:'@customer_id'), :secret => self.instance_variable_get(:'@secret'), :access_token => access_token}){ |response, request, result, &block|
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

    def post(path,options={})
      base_url = self.instance_variable_get(:'@base_url')

      url = base_url + path
      RestClient.post url, :client_id => self.instance_variable_get(:'@customer_id'),
            :secret => self.instance_variable_get(:'@secret'),
            :transaction_type => options[:transaction_type],
            :account_holder_name => options[:account_holder_name],
            :account_type => options[:account_type],
            :routing_number => options[:routing_number],
            :account_number => options[:account_number],
            :amount => options[:amount] { |response, request, result, &block|
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

    def patch(path,type,username,password,options={})
      base_url = self.instance_variable_get(:'@base_url')

      url = base_url + path
      RestClient.patch(url, :client_id => self.instance_variable_get(:'@customer_id') ,:secret => self.instance_variable_get(:'@secret'), :access_token => access_token, :type => type, :credentials => {:username => username, :password => password} ){ |response, request, result, &block|
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

    def delete(path,options={})
      base_url = self.instance_variable_get(:'@base_url')

      url = base_url + path
      RestClient.delete(url,:params => {:client_id => self.instance_variable_get(:'@customer_id'), :secret => self.instance_variable_get(:'@secret'), :access_token => access_token}){ |response, request, result, &block|
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
