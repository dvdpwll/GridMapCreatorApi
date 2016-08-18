curl --include --request POST http://localhost:3000/maps \
  --header "Content-Type: application/json" \
  --data '{
    "map": {
      "name": "Test Map",
      "user_id": "2"
    }
  }'
