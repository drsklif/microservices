FROM ruby:2.4-alpine3.6

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

RUN apk update && apk upgrade \
    && apk --no-cache add --virtual .build-deps \
    && apk --update --no-cache add build-base tzdata \
    && bundle install \
    && gem cleanup \
    && rm -rf /usr/lib/ruby/gems/*/cache/* \
    && rm -rf /root/.bundle \
    && apk del .build-deps \
    && apk del build-base

ADD . $APP_HOME

ENV COMMENT_DATABASE_HOST=comment_db COMMENT_DATABASE=comments
CMD ["puma"]
