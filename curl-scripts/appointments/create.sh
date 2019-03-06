curl "http://localhost:4741/appointments" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "appointment": {
      "date": "'"${DATE}"'",
      "doctor_id": "'"${DOCTOR}"'",
      "patient_id": "'"${PATIENT}"'"
    }
  }'

echo
