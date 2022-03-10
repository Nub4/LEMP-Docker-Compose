service mysql start 2>/dev/null;

if ! test -d /var/lib/mysql/$MYSQL_DATABASE;
then
	mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;
						GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;
						FLUSH PRIVILEGES;"

	mysqladmin -u root password "$MYSQL_ROOT_PASSWORD" 
fi

sleep 3 ;
mysqladmin -u root --password=$MYSQL_ROOT_PASSWORD shutdown

mysqld --bind-address=0.0.0.0