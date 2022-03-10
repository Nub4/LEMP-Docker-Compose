#!/bin/sh

ETC_HOSTS=/etc/hosts
IP="127.0.0.1"
HOSTNAME="minummin.42.fr"
HOSTS_LINE="$IP\t$HOSTNAME"

if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
    then
        echo "\033[1;31mHost already exist\033[0m";
    else
        sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";
        echo "\033[1;32mHost has been added succesfully!\033[0m";
fi