curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"
curl -s  -X POST -H "Content-Type: application/json; charset=UTF-8" "http://localhost:4000/create?[1-100]" -d  '{"user":"Joe","status":"new","description":"Elixir demo log entry"}' & pidlist="$pidlist $!"

for job in $pidlist do
  echo $job
  wait $job || let "FAIL+=1"
done

if [ "$FAIL" == "0" ]; then
  echo "YAY!"
else
  echo "FAIL! ($FAIL)"
fi