# convert to 'runit' init-type hookit 'service'
execute '/data/bin/redis-cli shutdown save && sv stop cache'
