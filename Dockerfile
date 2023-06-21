FROM ubuntu:22.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install curl php-cli php-mbstring \
    # Install any additional PHP or Laravel dependencies if needed

    # Remove package lists for smaller image sizes
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/cron.*/*

# Set the working directory to the root directory of the Laravel app
WORKDIR /

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
