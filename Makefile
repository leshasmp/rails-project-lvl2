install:
	bundle install

lint:
	bundle exec rubocop

tests:
	rake test

slim-lint:
	slim-lint app/views/	
	