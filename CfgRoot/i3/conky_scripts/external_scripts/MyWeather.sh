#!/bin/bash

metric="1"
location="florence"

toparse="$(curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric='${metric}'&locCode='${location})"
str=$(grep "<description>"<<<"${toparse}"|grep -i "${location}")

# delete fucking carriage return
# wt="$(sed -u s'/[\r]//'g<<<${str##*\ })"

for i in ${str}; do
	if [[ "$i" == [0-9] ]]; then
		temp=$i
		break
	fi

	# [ "$i" == "and" ] launch for and add element to array
done
