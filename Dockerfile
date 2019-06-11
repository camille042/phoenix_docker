# Use an official Elixir runtime as a parent image
FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client nodejs 

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

CMD ["/app/entrypoint.sh"]