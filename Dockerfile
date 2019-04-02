FROM ruby:2.6.2

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs=20 --retry=5

COPY . /app

CMD ["bundle", "exec", "middleman", "server", "--port", "4480"]
