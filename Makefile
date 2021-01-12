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
	docker-compose build \
	&& docker-compose run --rm web bash -c "bundle install && make db-reset"

compose-start:
	docker-compose up

compose-test:
	docker-compose run --rm web make test

compose-bash:
	docker-compose run --rm web bash

compose-restart-webpack:
	docker-compose restart webpack

.PHONY: test
