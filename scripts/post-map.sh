curl --include --request POST http://localhost:3000/maps \
  --header "Authorization: Token token=BAhJIiVmOGZmMjUwMTkzNjY5MWVkODkwNGMzYzE3NGI1ZTZjNwY6BkVG--9d510ea89db662a93d2de7d315925ed0cd9ff994" \
  --header "Content-Type: application/json" \
  --data '{
    "map": {
      "name": "Test Map",
      "user_id": "2"
    }
  }'
