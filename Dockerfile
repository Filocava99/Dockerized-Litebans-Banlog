FROM php:7.2-apache
LABEL author="tigierrei"
ENV WEB_DIR="/var/www/html"
RUN apt update -y
RUN apt install -y git
RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo pdo_mysql
RUN git clone https://gitlab.com/ruany/litebans-php.git ${WEB_DIR}/
RUN rm ${WEB_DIR}/inc/settings.php
RUN rm ${WEB_DIR}/lang/it_IT.utf8.php
COPY it_IT.utf8.php ${WEB_DIR}/lang/it_IT.utf8.php
COPY settings.php ${WEB_DIR}/inc/settings.php
EXPOSE 80