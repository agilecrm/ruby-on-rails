require "net/http"
require "uri"
require 'json'

class AgileCRM
  class << self
    def api_key=(key)
      @@api_key = key
    end

    def domain=(d)
      @@domain = d
    end
	
	def email=(email)
      @@email = email
    end

    def api_key
      @@api_key
    end

    def domain
      @@domain
    end
	
	def email
      @@email
    end

    def request(method, subject, data = {})
      path = "/dev/api/#{subject}"
      case method
      when :get
        request = Net::HTTP::Get.new(path)
      when :post
        request = Net::HTTP::Post.new(path)
        request.body = data.to_json
      when :put
        request = Net::HTTP::Put.new(path)
        request.body = data.to_json
      when :delete
        request = Net::HTTP::Delete.new(path)
      else
        raise "Unknown method: #{method}"
      end
      uri = URI.parse("https://#{domain}.agilecrm.com")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request["Content-Type"] = 'application/json'
	  request["Accept"] = 'application/json'
	  request.basic_auth AgileCRM.email, AgileCRM.api_key
      response = http.request(request)
      response.body
    end
  end
end

AgileCRM.api_key = '123456' # This is Rest API key
AgileCRM.domain = 'ghanshyam' # This is Domain
AgileCRM.email = 'ghanshyam.raut@agilecrm.com' # This is Email


#  ======================Create Contact====================================

contact_data = '{
    "star_value": "4",
    "lead_score": "92",
    "tags": [
        "Lead",
        "Likely Buyer"
    ],
    "properties": [
        {
            "type": "SYSTEM",
            "name": "first_name",
            "value": "Los "
        }
    ]
}'
parsed_contact_data = JSON.parse(contact_data) 
#print(AgileCRM.request :post, "contacts", parsed_contact_data) 

#  ======================Get Contact By ID====================================

#print(AgileCRM.request :get, "contacts/5762169748586496", nil) # Get Contact By Id

#  ======================Get Contact By Email====================================

#print(AgileCRM.request :get, "contacts/search/email/tester@agilecrm.com", nil) # Get Contact By Email

#  ======================Update Contact====================================

update_contact_data = '{
    "id": "5748927693324288",
    "properties": [
        {
            "type": "SYSTEM",
            "name": "last_name",
            "value": "Lee Chu"
        },
        {
            "type": "CUSTOM",
            "name": "My Custom Field",
            "value": "Custom value chane"
        }
    ]
}'
parsed_update_contact_data = JSON.parse(update_contact_data) 
#print(AgileCRM.request :put, "contacts/edit-properties", parsed_update_contact_data) 

#  ======================Delete Contact====================================

#print(AgileCRM.request :delete, "contacts/5748927693324288", nil) 

#  ======================Create Deal====================================

deal_data = '{
    "name": "Deal-Tomato",
    "expected_value": "500",
    "probability": "75",
    "close_date": 1455042600,
    "milestone": "Proposal",
    "contact_ids": [
        "5705059971104768"
    ],
    "custom_data": [
        {
            "name": "Group Size",
            "value": "10"
        }
    ]
}'
parsed_deal_data = JSON.parse(deal_data) 
#print(AgileCRM.request :post, "opportunity", parsed_deal_data)

#  ======================Update Deal====================================

update_deal_data = '{
    "id": "5743182100824064",
    "name": "Deal-Tomato-changed",
    "expected_value": "500",
    "probability": "75",
    "close_date": 1455042600,
    "milestone": "Proposal",
    "contact_ids": [
        "5705059971104768"
    ],
    "custom_data": [
        {
            "name": "Group Size",
            "value": "10"
        }
    ]
}'
parsed_update_deal_data = JSON.parse(update_deal_data) 
#print(AgileCRM.request :put, "opportunity/partial-update", parsed_update_deal_data)

#  ======================Get Deal By ID====================================

#print(AgileCRM.request :get, "opportunity/5743182100824064", nil) # Get Deal By Id

#  ======================Delete Deal By ID====================================

print(AgileCRM.request :delete, "opportunity/5743182100824064", nil) # Get Deal By Id