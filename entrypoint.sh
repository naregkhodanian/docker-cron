#!/bin/sh

# Run the job every 15 minutes using curl and log the response
while true; do
    echo "Running the job..."
    response=$(curl -s -H "Authorization: Bearer ${STATIC_API_TOKEN}" -H "Accept: */*" -H "Accept-Encoding: gzip, deflate, br" -H "Connection: keep-alive" "http://la-propane-portal:8080/api/quickbooks/run-job")
    echo "Job response: $response"
    echo "Job completed."
    sleep 43200  # Sleep for 12 hours
done

# Execute CMD
echo "$@"
exec "$@"

curl -s -H "Authorization: Bearer ${STATIC_API_TOKEN}" -H "Accept: */*" -H "Accept-Encoding: gzip, deflate, br" -H "Connection: keep-alive" "http://la-propane-portal:8080/api/quickbooks/run-job"