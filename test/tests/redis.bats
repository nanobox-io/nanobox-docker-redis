# source docker helpers
. util/docker.sh

@test "Start Container" {
  start_container "redis-test"
}

@test "Verify redis installed" {
  # ensure redis executable exists
  run docker exec "redis-test" bash -c "[ -f /data/bin/redis-server ]"

  [ "$status" -eq 0 ]
}

@test "Stop Container" {
  stop_container "redis-test"
}
