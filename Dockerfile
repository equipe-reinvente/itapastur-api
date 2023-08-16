# Use Ruby base image
FROM ruby:3.2.2

# Configure the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock /app/

# Install a gems
RUN bundle install

# Copy the rest of the code
COPY . /app/
