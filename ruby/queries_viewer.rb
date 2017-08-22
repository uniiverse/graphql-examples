require 'net/http'
require 'uri'
require 'json'

def graphql(query, access_token:)
  uri = URI.parse('https://www.universe.com/graphql/beta')
  http = Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = true }
  headers = {'Authorization' => "Bearer #{access_token}", 'Content-Type' => 'application/json'}
  request = Net::HTTP::Post.new(uri.path, headers)
  request.body = {query: query}.to_json
  http.request(request).body
end

puts graphql(
  "query GraphqlExample {
    viewer {
      id
      firstName
      lastName
    }
  }",
  access_token: 'access_token'
)
# => {
#   "data": {
#     "viewer": {
#       "id": "58d98e52bbdebd003804e065",
#       "firstName": "Evgeny",
#       "lastName": "Li"
#     }
#   }
# }
