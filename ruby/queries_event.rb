require 'net/http'
require 'uri'
require 'json'

def graphql(query, access_token)
  uri = URI.parse('https://www.universe.com/graphql/beta')
  http = Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = true }
  headers = {'Authorization' => "Bearer #{access_token}", 'Content-Type' => 'application/json'}
  request = Net::HTTP::Post.new(uri.path, headers)
  request.body = {query: query}.to_json
  http.request(request).body
end

access_token = 'your_access_token'
event_id = '5879ad8f6672e70036d58ba5'

puts graphql(
  "query GraphqlExample {
    event(id: \"#{event_id}\") {
      title
      state
      privacy
      address
      currency
      discounts {
        totalCount
        nodes(limit: 1) {
          code
          fixed
        }
      }
      rates {
        nodes(limit: 1) {
          price
          maxQuantity
        }
      }
      timeSlots {
        nodes(limit: 1) {
          startAt
          endAt
        }
      }
    }
  }",
  access_token
)
# => {
#   "data": {
#     "event": {
#       "title": "End of Unix Time",
#       "state": "POSTED",
#       "privacy": "PUBLIC",
#       "address": "17 Phoebe St, Toronto, ON M5T 1A8, Canada",
#       "currency": "ERN",
#       "discounts": {
#         "totalCount": 2,
#         "nodes": [
#           {
#             "code": "1234",
#             "fixed": 5
#           }
#         ]
#       },
#       "rates": {
#         "nodes": [
#           {
#             "price": 10,
#             "maxQuantity": 100
#           }
#         ]
#       },
#       "timeSlots": {
#         "nodes": [
#           {
#             "startAt": "2038-01-19T00:00:00-05:00",
#             "endAt": "2038-01-19T01:00:00-05:00"
#           }
#         ]
#       }
#     }
#   }
# }
