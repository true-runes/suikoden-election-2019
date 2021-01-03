#!/bin/bash -xe

circleci build \
--env PG_USERNAME=foobar \
--env PG_PASSWORD=foobar \
--env PG_HOST=foobar \
--env CONSUMER_KEY=foobar \
--env CONSUMER_SECRET=foobar \
--env ACCESS_TOKEN=foobar \
--env SPREADSHEETS_ID_COUNTING_VOTES=foobar \
--env BASIC_AUTH_USERNAME=foobar \
--env BASIC_AUTH_PASSWORD=foobar

exit 0
