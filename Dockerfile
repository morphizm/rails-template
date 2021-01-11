FROM ruby:3-alpine

ARG RAILS_ROOT=/app
ARG PACKAGES="vim openssl-dev postgresql-dev build-base curl nodejs yarn less tzdata git postgresql-client bash screen ncurses"
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"
ENV PATH=$RAILS_ROOT/bin:${PATH}

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

WORKDIR $RAILS_ROOT

RUN gem update --system
RUN gem install bundler:2.1.4 && gem install rubygems-bundler && gem regenerate_binstubs

COPY Gemfile* ./

RUN bundle config set no-cache 'true' && bundle install --jobs 4

RUN yarn install --check-files

ADD . $RAILS_ROOT

RUN RAILS_ENV=production SECRET_KEY_BASE=secret rails assets:precompile

RUN mkdir -p tmp/assets/source_maps \
      && cp public/packs/js/* tmp/assets/source_maps \
      && rm -r public/packs/js/*.map*

ARG APP_VERSION
ENV APP_VERSION=${APP_VERSION}

VOLUME ["/app/public"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
