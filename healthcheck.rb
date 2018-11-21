require 'net/http'
response = Net::HTTP.get_response(URI('http://127.0.0.1:3000'))
if response.code == '200'
    exit
else
    raise("PROBLEM")
end
