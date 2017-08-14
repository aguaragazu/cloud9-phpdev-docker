FROM minhnhut/cloud9

# Add add-apt-repository command
RUN apt-get update && \
    apt-get install -y software-properties-common \
                    python-pip \
                    python-dev

# Add Repo ppa:ondrej/php
# Install php common extension
# zip and unzip is essential component for composer to run 
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php7.0 \
                    php7.0-common \
                    php7.0-pdo \
                    php7.0-mysql \
                    php7.0-curl \
                    php7.0-mbstring \
                    php7.0-xml \
                    zip \
                    unzip

# Install composer
# how can a PHP developer miss the Composer :)
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install code intellisense
# https://github.com/c9/c9.ide.language.codeintel
RUN pip install -U virtualenv && \
    virtualenv --python=python2 /root/.c9/python2 && \
    . /root/.c9/python2/bin/activate && \
    mkdir /tmp/codeintel && \
    pip download -d /tmp/codeintel codeintel==0.9.3 && \
    cd /tmp/codeintel && \
    tar xf CodeIntel-0.9.3.tar.gz && \
    mv CodeIntel-0.9.3/SilverCity CodeIntel-0.9.3/silvercity && \
    tar czf CodeIntel-0.9.3.tar.gz CodeIntel-0.9.3 && \
    pip install -U --no-index --find-links=/tmp/codeintel codeintel
