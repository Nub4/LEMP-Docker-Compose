sleep 7 ;

if ! test -f "wp-config.php";
then
	# Download core Wordpress files
	wp --allow-root core download --version=5.9.1 ;
	# Generate a wp-config.php file
	wp --allow-root config create --dbhost=$WORDPRESS_DB_HOST \
									--dbname=$WORDPRESS_DB_NAME \
									--dbuser=$WORDPRESS_DB_USER \
									--dbpass=$WORDPRESS_DB_PASSWORD ;
	# Run standard Wordpress installation process							
	wp --allow-root core install --url=minummin.42.fr \
									--title=minummin.42.fr \
									--admin_user=$WORDPRESS_ADMIN \
									--admin_password=$WORDPRESS_ADMIN_PASS \
									--admin_email=$WORDPRESS_ADMIN_EMAIL \
									--skip-email ;
	# Create a new user
	wp --allow-root user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
									--role=$WORDPRESS_USER_ROLE \
									--user_pass=$WORDPRESS_USER_PASS ;
fi

/usr/sbin/php-fpm7.3 -F ;