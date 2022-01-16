#!/bin/sh

MESSAGE=$1

#echo "`date` $TOPIC_ARN $SUBJECT" >> /tmp/zabbix-sns.log

if [ "$MESSAGE" = "" ]; then
  MESSAGE=$SUBJECT
fi

aws sns publish --topic-arn arn:aws:sns:ap-northeast-1:610315729489:SKRI-ZBX --message "$MESSAGE"