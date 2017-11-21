FROM ruby:2.4-alpine3.6
LABEL maintainer="Alexander Ildjakov <a.ildjakov@gmail.com>"

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

# RUN apk --no-cache add --virtual .build-deps \
#     build-base \
#     ruby-dev \
#     ruby-bundler \
#   && bundle install \
#   && gem cleanup \
#   && rm -rf /usr/lib/ruby/gems/*/cache/* \
#   && rm -rf /root/.bundle \
#   \
#   && apk del .build-deps

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk update && apk upgrade \
    && apk --no-cache add --virtual .build-deps \
    && apk --update --no-cache add build-base \
    && bundle install \
    && gem cleanup \
    && rm -rf /usr/lib/ruby/gems/*/cache/* \
    && rm -rf /root/.bundle \
    && apk del .build-deps \
    && apk del build-base

ADD . $APP_HOME

ENV POST_SERVICE_HOST=post POST_SERVICE_PORT=5000 COMMENT_SERVICE_HOST=comment COMMENT_SERVICE_PORT=9292
CMD ["puma"]
