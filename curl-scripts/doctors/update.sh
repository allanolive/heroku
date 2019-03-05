curl "http://localhost:4741/patients/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "patient": {
      "first_name": "'"${FIRST}"'",
      "last_name": "'"${LAST}"'",
      "born_on": "'"${BORN}"'",
      "diagnosis": "'"${DIAGNOSIS}"'"
    }
  }'

echo
