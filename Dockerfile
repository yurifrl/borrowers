FROM node:4.0.0

ENV USER root

# Note: npm is v2.7.6
RUN npm install -g ember-cli --allow-root
RUN npm install -g bower
RUN npm install -g phantomjs

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted" | tee -a /etc/apt/sources.list.d/precise-updates.list
RUN apt-get update -qq
RUN apt-get install -y python2.7-dev

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.7.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

# Create folder
RUN mkdir /borrowers

# Define workdir
WORKDIR /borrowers

# Add files
ADD . /borrowers

# define volume
VOLUME ["/borrowers"]

# Expose the ports that your borrowers uses. For example:
EXPOSE 4200 49152

# ln -s  ../vendor/modules/spree-ember/packages/core node_modules/spree-ember-core
# ln -s  ../vendor/modules/spree-ember/packages/checkouts node_modules/spree-ember-checkouts
# ln -s  ../vendor/modules/yebo_sdk bower_components/yebo_sdk

# $ docker-compose run borrowers npm install
# $ docker-compose run borrowers bower install --allow-root
