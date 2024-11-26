# Base image
FROM ruby:3.2.2

# Set environment variables
ENV RAILS_ENV=development \
  RAILS_LOG_TO_STDOUT=true \
  RAILS_SERVE_STATIC_FILES=true \
  BUNDLER_VERSION=2.3.25

# Install required packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v "$BUNDLER_VERSION" && bundle install --jobs 4 --retry 3

# Copy the application files
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]