# GraphQL Examples

[![Build Status](https://travis-ci.org/uniiverse/graphql-examples.svg?branch=master)](https://travis-ci.org/uniiverse/graphql-examples)

In this repository you'll find some examples of using our [GraphQL API](https://developers.universe.com/page/graphql-explorer).

## Contents

* [Authentication](#authentication)
* [Queries](#queries)
  * [Viewer](#viewer)
* [Mutatations](#mutations)
  * [Save Event](#save-event)

## Authentication

To use our API, please see the [guide](https://developers.universe.com/docs/authorizing-with-oauth) how to get an access token by using OAuth 2.0.

## Queries

### Viewer

`Viewer` is the user who makes the current GraphQL request.

<details name="curl/queries_viewer.sh"><summary><strong>cURL example</strong></summary>
<p>

```sh
export ACCESS_TOKEN=access_token

curl https://www.universe.com/graphql/beta \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -d @- << EOF
{
  "query": "query GraphqlExample {
    viewer {
      id
      firstName
      lastName
    }
  }"
}
EOF
# => {
#   "data": {
#     "viewer": {
#       "id": "58d98e52bbdebd003804e065",
#       "firstName": "Evgeny",
#       "lastName": "Li"
#     }
#   }
# }
```

</p>

</details>

<details name="ruby/queries_viewer.rb"><summary><strong>Ruby example</strong></summary>
<p>

```rb
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
```

</p>

</details>

## Mutatations

### Save Event

Coming soon

## Contributing

Please check out the [CONTRIBUTING.md](./CONTRIBUTING.md) guide.