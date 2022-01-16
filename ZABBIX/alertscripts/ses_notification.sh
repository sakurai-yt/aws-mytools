#!/bin/bash

TO=$1
SUBJECT=$2
MESSAGE=$3
FROM=$4

echo "`date` $TO $SUBJECT" >> /tmp/zabbix-ses.log

if [ "$SUBJECT" = "" -o "$TO" = "" ]; then
  echo "usage: $0 {TO SUBJECT MESSAGE FROM}"
  exit 1
fi

if [ "$MESSAGE" = "" ]; then
  MESSAGE=$SUBJECT
fi

aws ses send-email --from $FROM --to $TO --subject "$SUBJECT" --text "$MESSAGE"