reset:
	bundle exec rails db:environment:set db:drop db:create db:migrate db:seed

server:
	rails server
