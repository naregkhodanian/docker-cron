#!/bin/sh

# Set the bearer token from the environment variable
BEARER_TOKEN="Bearer ${STATIC_API_TOKEN}"
echo $BEARER_TOKEN

# Run the job every 15 minutes using curl and log the response
while true; do
    echo "Running the job..."
    response=$(curl -s -H "Authorization: ${BEARER_TOKEN}" http://la-propane-portal/api/quickbooks/run-job)
    echo "Job response: $response"
    echo "Job completed."
    sleep 60  # Sleep for 60 seconds (1 minute)
done

# Execute CMD
echo "$@"
exec "$@"
