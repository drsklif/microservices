# base image
FROM ubuntu:16.04

# update repository cache
RUN apt-get update
# install required packages
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler
# get app
RUN git clone https://github.com/Artemmkin/reddit.git

# copy config files
COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

# install dependencies and configure
RUN cd /reddit && bundle install
RUN mkdir -p /data/db
RUN chmod 0777 /start.sh

# start service
CMD ["/start.sh"]
