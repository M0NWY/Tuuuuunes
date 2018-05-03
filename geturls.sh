#!/bin/bash

# get whole website html files only !
wget --mirror -A "*.html" www.global-sets.com

# code to pull links from html
grep -r zipp ./www.global-sets.com/*| grep href | grep -o '".*"' | sed 's/"//g'> urls.txt

