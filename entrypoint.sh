#!/bin/sh

env >> /etc/environment

# Run the job every 15 minutes using curl and log the response
while true; do
    echo "Running the job..."
    response=$(curl -s http://la-propane-portal/quickbooks/run-job)
    echo "Job response: $response"
    echo "Job completed."
    sleep 900  # Sleep for 900 seconds (15 minutes)
done

# Execute CMD
echo "$@"
exec "$@"
