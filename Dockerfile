FROM minhnhut/cloud9

# Add add-apt-repository command
RUN apt-get update && \
    apt-get install -y software-properties-common

# Add Repo ppa:ondrej/php
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

# Install php common extension
RUN apt-get update && \
    apt-get install -y php7.0 \
                    php7.0-common \
                    php7.0-pdo \
                    php7.0-mysql \
                    php7.0-curl \
                    php7.0-mbstring

# Install composer
# how can a PHP developer miss the Composer :)
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer