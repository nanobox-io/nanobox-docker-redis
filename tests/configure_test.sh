VERSION=$1
echo running tests for $VERSION of redis
UUID=$(cat /proc/sys/kernel/random/uuid)

pass "unable to start the $VERSION container" docker run --privileged=true -d --name $UUID nanobox/redis:$VERSION
defer docker kill $UUID

# now we just need to verify that changes were atually made correctly.