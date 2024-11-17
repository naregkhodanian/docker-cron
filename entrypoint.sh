#!/bin/sh

# Function to run the QuickBooks job every 12 hours
run_quickbooks_job() {
    while true; do
        echo "Running the QuickBooks job..."
        response=$(curl -s -H "Authorization: Bearer ${STATIC_API_TOKEN}" -H "Accept: */*" -H "Accept-Encoding: gzip, deflate, br" -H "Connection: keep-alive" "http://la-propane-portal:8080/api/quickbooks/run-job")
        echo "Job response: $response"
        echo "QuickBooks job completed."
        sleep 43200  # Sleep for 12 hours
    done
}

# Start the QuickBooks job in the background
run_quickbooks_job 
