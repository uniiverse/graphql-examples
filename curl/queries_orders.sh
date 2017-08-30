export ACCESS_TOKEN=your_access_token
export EVENT_ID=5879ad8f6672e70036d58ba5

curl https://www.universe.com/graphql/beta \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d @- << EOF
{
  "query": "query GraphqlExample {
    event(id: \"$EVENT_ID\") {
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
  }"
}
EOF
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
