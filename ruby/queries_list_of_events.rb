require 'net/http'
require 'uri'
require 'json'

def graphql(query)
  uri = URI.parse('https://www.universe.com/graphql/beta')
  http = Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = true }
  request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
  request.body = {query: query}.to_json
  http.request(request).body
end

puts graphql(
  "query GraphqlExample {
    host(id: \"4f5e06cb2078f9730c000014\") {
      name
      events {
        totalCount
        nodes {
          id
          title
        }
      }
    }
  }"
)
# => {
#   "data": {
#     "host": {
#       "name": "Joshua Kelly",
#       "events": {
#         "totalCount": 1,
#         "nodes": [
#           {
#             "id": "5879ad8f6672e70036d58ba5",
#             "title": "End of Unix Time"
#           }
#         ]
#       }
#     }
#   }
# }
