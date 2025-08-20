FROM ruby:3.3.4

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential libpq-dev nodejs curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock* /app/
RUN gem install bundler && bundle install

COPY . /app

ENV RAILS_ENV=development
CMD ["bash", "script/dev-start.sh"]
