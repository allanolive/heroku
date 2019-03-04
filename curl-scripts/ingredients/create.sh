curl "http://localhost:4741/ingredients" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "ingredient": {
      "name": "'"${NAME}"'",
      "unit": "'"${UNIT}"'"
    }
  }'

echo
