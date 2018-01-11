# Reference https://pilsniak.com/docker-symfony/
FROM php:latest

# Setup composer, other php extensions and the symfony project
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get update && apt-get install -y git libpng-dev && \
    docker-php-ext-install zip && docker-php-ext-enable zip  && \
    mkdir -p /appcode && \
    composer create-project symfony/framework-standard-edition /appcode/ && \
    chmod +x /appcode/bin/console

# Expose 8080 to access brand new symfony welcome page
EXPOSE 8080

# Run the project
CMD /appcode/bin/console server:run 0.0.0.0:8080

# Volume for code mount
VOLUME /appcode/