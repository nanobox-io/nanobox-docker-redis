nanobox redis
============

This repo contains the files necessary to create a code docker image for [nanobox](nanobox.io) consumption.


Requirements
------------

* `docker_user` environment variable `export docker_user='nanobox'`
* `~/.dockercfg` file with credentials for `docker_user`
* [vagrant](vagrantup.com)
* [dockerhub](hub.docker.com) account


Usage
-----

To create the image `nanobox/redis` simply run      
`make` or `make image` followed by `make tag`    
If the creation/publication fails for any reason, you may       
modify the proper files and run `make image`.    
        
To login to the zone:
```
user: gonano
pass: gonano
```
        

License
-------

Mozilla Public License, version 2.0
