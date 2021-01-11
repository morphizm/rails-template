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
