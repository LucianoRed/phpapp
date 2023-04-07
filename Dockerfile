# Use a PHP base image with the version you need
FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Copy the code from the host into the container
COPY . .

# Install any necessary dependencies
RUN apt-get update && \
    apt-get install -y \
        libpq-dev \
        && \
    docker-php-ext-install \
        pdo \
        pdo_pgsql \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the port that the web server will listen on
EXPOSE 80

# Start the Apache web server
CMD ["apache2-foreground"]
