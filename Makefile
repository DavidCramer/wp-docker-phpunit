-include ./.env

# Required because we need these vars in a non-typical docker-compose way.
WPDIR=WP_INSTALL_DIR=${WP_INSTALL_DIR}
WPVER=WP_VERSION=${WP_VERSION}
WPTEST=WP_TESTS_DIR=${WP_TESTS_DIR}
WPENV=${WPDIR} ${WPVER} ${WPTEST}

# Show available make commands.
usage:
	@echo "Usage:\n  make setup"

setup:
	@${WPENV} docker-compose up -d tests-php
	@echo "Updating WordPress Test Suite..."
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/includes/ ./tests/includes --trust-server-cert --non-interactive -q
	@svn co https://develop.svn.wordpress.org/tags/${WP_VERSION}/tests/phpunit/data/ ./tests/data --trust-server-cert --non-interactive -q
	@composer update
	@${WPENV} docker-compose exec tests-php sh test-setup
	@echo "Stopping Docker containers..."
	@${WPENV} docker-compose down

