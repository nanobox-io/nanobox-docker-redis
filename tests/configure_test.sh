VERSION=$1
echo running tests for $VERSION of postgresql
UUID=$(cat /proc/sys/kernel/random/uuid)

pass "unable to start the $VERSION container" docker run --privileged=true -d --name $UUID nanobox/redis:$VERSION
defer docker kill $UUID

# we should be able to run the basic configure hook
pass "unable to run the configure hook for $VERSION" docker exec $UUID /opt/bin/default-configure "$PAYLOAD"

# now we just need to verify that changes were atually made correctly.