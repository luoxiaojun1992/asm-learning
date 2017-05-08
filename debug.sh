#! /bin/bash
appName=$1
./compile.sh $appName
./$appName
