FROM php:7.4-fpm
	RUN apt -yqq update
	RUN apt -yqq install libxml2-dev git default-mysql-client msmtp
	RUN docker-php-ext-install mysqli
        RUN docker-php-ext-install pdo pdo_mysql
