<?php
/**
 * PHPUnit bootstrap file
 *
 * @package PluginTest
 */

$_tests_dir = getenv( 'WP_TESTS_DIR' );
if ( ! file_exists( $_tests_dir . '/includes/functions.php' ) ) {
	echo "Could not find $_tests_dir/includes/functions.php, have you run bin/install-wp-tests.sh ?" . PHP_EOL;
	exit( 1 );
}

// Give access to tests_add_filter() function.
require_once $_tests_dir . '/includes/functions.php';

/**
 * Manually load the plugin being tested.
 */
function _manually_load_plugin() {
	$_test_plugin = getenv( 'WP_TEST_PLUGIN' );
	if ( ! empty( $_test_plugin ) && file_exists( '/app/tests/core/wp-content/plugins/' . $_test_plugin ) ) {
		require '/app/tests/core/wp-content/plugins/' . $_test_plugin;
	}
}

tests_add_filter( 'muplugins_loaded', '_manually_load_plugin' );

// Start up the WP testing environment.
require $_tests_dir . '/includes/bootstrap.php';
