#!/usr/bin/env bash

# delete password
unset USER_PASS

# start and stop services
service rsyslog start
service ssh start
if [ -f /var/run/redis_6379.pid ]; then
   /etc/init.d/redis_6379 stop
   rm /var/run/redis_6379.pid
fi

# start supervisord
sudo -u $USER_ID -i '/usr/bin/supervisord'

# run bash in user account
sudo -u $USER_ID -i '/bin/bash'
