#!/bin/sh

# Set the bearer token from the environment variable
BEARER_TOKEN="Bearer ${STATIC_API_TOKEN}"

# Run the job every 15 minutes using curl and log the response
while true; do
    echo "Running the job..."
    response=$(curl -s -H "Authorization: ${BEARER_TOKEN}" https://app.la-propane.com/api/quickbooks/run-job)
    echo "Job response: $response"
    echo "Job completed."
    sleep 43200  # Sleep for 12 hours
done

# Execute CMD
echo "$@"
exec "$@"
