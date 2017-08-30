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
      orders {
        totalCount
        nodes(limit: 2) {
          id
          state
          createdAt
          orderItems {
            totalCount
          }
          timeSlot {
            startAt
            endAt
          }
          buyer {
            name
            email
          }
        }
      }
    }
  }",
  access_token
)
# => {
#   "data": {
#     "event": {
#       "orders": {
#         "totalCount": 14,
#         "nodes": [
#           {
#             "id": "587e95e60ae44d002a1dfd26",
#             "state": "PAID",
#             "createdAt": "2017-01-17T22:08:38Z",
#             "orderItems": {
#               "totalCount": 1
#             },
#             "timeSlot": {
#               "startAt": "2038-01-19T00:00:00-05:00",
#               "endAt": "2038-01-19T01:00:00-05:00"
#             },
#             "buyer": {
#               "name": "Joshua Kelly",
#               "email": "jdjkelly@gmail.com"
#             }
#           },
#           {
#             "id": "587e96a39b577e002a4a39f5",
#             "state": "PAID",
#             "createdAt": "2017-01-17T22:11:48Z",
#             "orderItems": {
#               "totalCount": 2
#             },
#             "timeSlot": {
#               "startAt": "2038-01-19T00:00:00-05:00",
#               "endAt": "2038-01-19T01:00:00-05:00"
#             },
#             "buyer": {
#               "name": "Joshua Kelly",
#               "email": "jdjkelly@gmail.com"
#             }
#           }
#         ]
#       }
#     }
#   }
# }
