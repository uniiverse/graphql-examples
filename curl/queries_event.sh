export ACCESS_TOKEN=your_access_token
export EVENT_ID=5879ad8f6672e70036d58ba5

curl https://www.universe.com/graphql/beta \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d @- << EOF
{
  "query": "query GraphqlExample {
    event(id: \"$EVENT_ID\") {
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
  }"
}
EOF

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
