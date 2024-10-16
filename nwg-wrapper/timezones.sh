#!/usr/bin/env bash

# Some countries below have more than one time zone,
# and it makes sense to use cities instead of countries.
# Use tzselect to find their time zones.

time=$(TZ='Europe/Istanbul' date +'%H:%M:%S')
echo '<span size="25000" foreground="#998000" face="monospace" weight="bold">Turkey '$time'</span>'

echo '<span size="large" face="monospace" foreground="#ccc">'
time=$(TZ='Africa/Lagos' date +"%H:%M")
echo 'Nigeria	<b>'$time'</b>'

echo '</span>'

