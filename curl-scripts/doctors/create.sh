curl "http://localhost:4741/doctors" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "doctor": {
      "first_name": "'"${FIRST}"'",
      "last_name": "'"${LAST}"'",
      "zip_code": "'"${ZIP}"'",
      "specialty": "'"${SPECIALTY}"'"
    }
  }'

echo
