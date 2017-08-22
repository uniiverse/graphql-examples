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
