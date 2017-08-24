curl https://www.universe.com/graphql/beta \
  -H "Content-Type: application/json" \
  -d @- << EOF
{
  "query": "query GraphqlExample {
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
}
EOF
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
