#!/bin/sh

ETC_HOSTS=/etc/hosts
IP="127.0.0.1"
HOSTNAME="minummin.42.fr"

if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
then
    sudo sed -i".bak" "/$HOSTNAME/d" $ETC_HOSTS
    echo "\033[1;32mHost has been removed!\033[0m";
else
    echo "\033[1;31mHostname has been already removed\033[0m";
fi