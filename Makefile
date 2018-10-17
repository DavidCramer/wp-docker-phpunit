-include ./.env

# Show available make commands.
usage:
	@echo "Usage:\n  make setup"

setup:
	@cp .env.dist .env
	@echo "Updating WordPress Test Suite..."
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/includes/ ./tests/includes --trust-server-cert --non-interactive -q
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/data/ ./tests/data --trust-server-cert --non-interactive -q
	@composer update

