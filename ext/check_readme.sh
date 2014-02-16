#!/bin/bash
#
# Copyright 2014 - Garrett Honeycutt <contact@garretthoneycutt.com>
#
# Licensed under Apache Software License v2.0
#
# usage: ./check_readme.sh manifests/init.pp README.md
#
# Simple script to check that parameters in a class are found in the README.
# This script is opionated on the style of the README. It takes two arguments,
# the first is the path to the manifest and the second is the path to the
# README. It will exit 0 on success, 255 on error, or with the number of
# missing parameters from the README. If there are missing entries, each
# parameter will be listed on its own line on stdout.
#
# assumes that a class or define looks like this
#
#  class foo (
#    $param = 'value',
#  ) {
#
if [ $# -ne 2 ]; then
  echo "usage: $0 path/to/manifest.pp path/to/README.md"
  exit 255
fi

# exit code that starts are 0 (success) and increments by one for every missing
# parameter
cnt=0

# the line where the class or define begins
CLASS_START_LINE=`grep -n -m1 -ie ^class -e ^define $1 | cut -f1 -d:`

# the line where the class or define ends
CLASS_END_LINE=`grep -n -m1 ^') {' $1 | cut -f1 -d:`

# how many lines to pass to head
let HEAD_LINES=${CLASS_END_LINE}-1

# how many lines to pass to tail
let TAIL_LINES=${HEAD_LINES}-${CLASS_START_LINE}

# get the parameter names
for param in $(head -n $HEAD_LINES $1 | tail -n $TAIL_LINES | awk -F \$ '{print $2}' | awk '{print $1}')
do

  # quietly look to see if the parameter is found at the beginning of the line
  # in the README
  grep -q ^$param $2

  # if not, increment the exit code and print the name of the missing parameter
  # to stdout
  if [ $? -ne 0 ]; then
    echo $param
    let "cnt += 1"
  fi
done

exit $cnt
