#!/bin/sh

USERNAME=youremail@gmail.com
PASSWORD=password
HOST=yourhost.no-ip.biz
LOGFILE=/root/logs/noip.log
STOREDIPFILE=/root/logs/current_ip
USERAGENT="Simple Bash No-IP Updater/0.5 $USERNAME"

if [ ! -e $STOREDIPFILE ]; then
        touch $STOREDIPFILE
fi


NEWIP=$(wget -O -  http://www.mioip.it/ )
STOREDIP=$(cat $STOREDIPFILE)

if [ "$NEWIP" != "$STOREDIP" ]; then
        RESULT=$(wget -q -U "$USERAGENT" -O -  "http://$USERNAME:$PASSWORD@dynupdate.no-ip.com/nic/update?hostname=$HOST&myip=$NEWIP")

        LOGLINE="[$(date +"%Y-%m-%d %H:%M:%S")] $RESULT"
        echo $RESULT
        echo $NEWIP > $STOREDIPFILE
else
        LOGLINE="[$(date +"%Y-%m-%d %H:%M:%S")] No IP change"
fi

echo $LOGLINE >> $LOGFILE

exit 0
