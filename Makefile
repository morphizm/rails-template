setup:
	bundle install
	yarn install
	rails db:create
	rails db:migrate
	rails db:seed

test:
	rails test

locally-start:
	postgres
	rails s

db-reset:
	bundle exec rails db:drop
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed

lint-rubocop:
	bundle exec rubocop

lint-js:
	yarn eslint .

lint: lint-js lint-rubocop

compose-build:
	docker-compose build
	make compose-bash
	make setup

compose-start:
	docker-compose up

compose-test:
	docker-compose run --rm web make test

compose-bash:
	docker-compose run --rm web bash

.PHONY: test
