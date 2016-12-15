#!/bin/bash

if [[ $SLACK_WEBHOOK == "" ]]; then
	echo "Error: export webhook as SLACK_WEBHOOK to continue. Exiting." >&2
	exit 1
fi

arr[0]="@channel this is your bubbe here reminding you to help either other during Commitmukkah! Thank you honey."
arr[1]="@channel I know you know what you're doing, but I want to remind you that <http://rogerdudler.github.io/git-guide/|git guide> is a VERY helpful place. Now go commit your code honey!"
arr[2]="@channel just write some Markdown today... it's all I ask! Everything you need is <http://www.markdowntutorial.com/|in this tutorial.> Oy veh."

rand=$[ $RANDOM % 3 ]
echo "Trying to post to Slack..\n"

curl -X POST --data-urlencode 'payload={"channel": "#bot-spam", "username": "bubbebot", "text": "'"${arr[$rand]}"'"}' $SLACK_WEBHOOK

echo "Done posting.\n"
