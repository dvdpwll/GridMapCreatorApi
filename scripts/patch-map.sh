curl --include --request PATCH http://localhost:3000/maps/1 \
  --header "Content-Type: application/json" \
  --data '{
    "map": {
      "name": "TestTe3stTEset"
    }
  }'
