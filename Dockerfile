FROM php:latest
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get update && apt-get install -y git libpng-dev
RUN docker-php-ext-install zip && docker-php-ext-enable zip
RUN mkdir -p /appcode
RUN composer create-project symfony/framework-standard-edition /appcode/
RUN chmod +x /appcode/bin/console
EXPOSE 8080
CMD /appcode/bin/console server:run 0.0.0.0:8080
VOLUME /appcode/