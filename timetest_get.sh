#!/bin/sh

echo "Starting Curl Timer (running 100 gets with 10 process)"
echo "time ./timetest_get.sh"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"

curl -s  "http://localhost:4000/read?id=1[1-100]" > redirect.out  &
pidlist="$pidlist $!"






for job in $pidlist
do
  echo $job
  wait $job || let "FAIL+=1"
done

echo "END Curl Timer"