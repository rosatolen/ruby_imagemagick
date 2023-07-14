FROM ruby:3.0.6-alpine

RUN apk add --no-cache build-base gcompat postgresql-dev libffi-dev tzdata imagemagick imagemagick-dev imagemagick-libs
