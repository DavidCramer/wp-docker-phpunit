-include ./.env

# Show available make commands.
usage:
	@echo "Usage:\n  make setup"

setup:
	@${WPENV} docker-compose up -d tests-php
	@echo "Updating WordPress Test Suite..."
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/includes/ ./tests/includes --trust-server-cert --non-interactive -q
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/data/ ./tests/data --trust-server-cert --non-interactive -q
	@composer update
	@docker-compose exec tests-php sh test-setup
	@echo "Stopping Docker containers..."
	@docker-compose down

