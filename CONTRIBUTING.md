# How to contribute to the GraphQL Examples

## Adding new examples

### Add Your Example in a Separate Branch

For example:

* `curl/queries_new_field.sh`

```sh
curl https://www.universe.com/graphql/beta \
  -H "Content-Type: application/json" \
  -d @- << EOF
{
  "query": "query GraphqlExample {
    newField {
      id
    }
  }"
}
EOF
# => {
#   "data": {
#     "newField": {
#       "id": "123123123"
#     }
#   }
# }
```

* `README.md`

```md
## Contents

* [Queries](#queries)
  * [New Field](#new-field)

## Queries

### New Field

<details name="curl/queries_new_field.sh"><summary><strong>cURL example</strong></summary>
</details>
```

Committing the changes will paste the source code to README automatically with `pre-commit` and `make generate` (idempotent).

### Add tests

Don't forget to set correct permissions to be able to execute the script:

```sh
$ chmod 755 ./curl/queries_new_field.sh
```

Add tests like:

```ruby
result = `./curl/queries_new_field.sh`
expect(result).to eq(some_response)
```

### Submit a Pull Request

Open a Pull Request with your changes.
