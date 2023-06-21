#!/bin/sh

env >> /etc/environment

# Run the job every 15 minutes using curl
while true; do
    echo "Running the job..."
    curl http://la-propane-app/quickbooks/run-job >/dev/null 2>&1
    echo "Job completed."
    sleep 900  # Sleep for 900 seconds (15 minutes)
done

# Execute CMD
echo "$@"
exec "$@"
