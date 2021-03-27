FROM michaelgatesdev/omeka:2.8

ADD super8festivals-omeka-plugin /var/www/html/plugins/SuperEightFestivals
ADD super8festivals-omeka-theme /var/www/html/themes/SuperEightFestivals

# We need NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y nodejs

# We need Yarn package manager
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn

# we need to install node modules and let snowpack copy them to where they're acceessible
RUN cd /var/www/html/plugins/SuperEightFestivals/ && yarn install
RUN cd /var/www/html/themes/SuperEightFestivals/ && yarn install