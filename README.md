# wp-docker-phpunit

Quick Setup:

Clone repo to the root of your PhpStorm Project.

`git clone git@github.com:DavidCramer/wp-docker-phpunit.git phpunit`

`cd phpunit`

`make setup`

Edit the `.env` file and set the `WP_INSTALL_DIR` to your WordPress root folder reletive to the path you cloned to. i.e it will start with `../` Then go up to your install dir.

In PhpStorm:
Preferences->PHP and add a new CLI Interpreter. 

Add new from Docker.
Select Docker Compose, then select the `docker-compose.yml` in the cloned folder.
Select `tests-php` in the services select.
Click OK.

You should see the PHP version now showing.
Click OK.

Go to PHP->Test Frameworks and add a new `PHPUnit by Remote Interpreter`
Select `tests-php` (or what ever you named it) and click OK.
In PHPUnit Library, select `Use Composer autoloader`
In Path to script, enter `/app/vendor/autoload.php` and click the reload icon nect to the input.
You should see the PHPUnit version show.
In Test Runner, select Default configuration file, and set the path to `/app/tests/phpunit.xml.dist`

Click OK.

Go to Run->Edit Configurations and add a new `PHPUnit` and name it `PHPUnit` (or whatever you want)
in Test Runner, select `Defined in the configuration file`
Check Use Alternative, and then select the your `phpunit.xml` in the plugin you're testing.
In Test runner options, add `--bootstrap /app/tests/bootstrap.php` 

In environment variables, add `WP_TEST_PLUGIN=my-plugin/plugin.php` where my-plugin is the folder of the plugin in `plugins` and `plugin.php` the main plugin file.

Click OK.

You should now be able to go to Run->Run 'PHPUnit' (or what ever you called it).

With this configuration, you'll also be able to run->Debug 'PHPUnit' and it will stop at breakpoints you set within the tests and the code your testing.

You'll also be able to do run with coverage.
