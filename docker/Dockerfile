FROM php:7.1-jessie

# install tools
RUN apt-get update && \
    apt-get install -y wget fop

# install composer
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer \
        -O - -q | php -- --quiet

COPY ./ /app
WORKDIR /app

EXPOSE 8000

CMD cd /app/public && php -S 0.0.0.0:8000
