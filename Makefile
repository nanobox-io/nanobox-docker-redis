# -*- mode: make; tab-width: 4; -*-
# vim: ts=4 sw=4 ft=make noet
all: build publish

LATEST:=3.0
stability?=latest
version?=$(LATEST)
dockerfile?=Dockerfile-$(version)

login:
	@vagrant ssh -c "docker login"

build:
	@echo "Building 'redis' image..."
	@vagrant ssh -c "docker build -f /vagrant/Dockerfile-${version} -t nanobox/redis /vagrant"

publish:
	@echo "Tagging 'redis:${version}-${stability}' image..."
	@vagrant ssh -c "docker tag -f nanobox/redis nanobox/redis:${version}-${stability}"
	@echo "Publishing 'redis:${version}-${stability}'..."
	@vagrant ssh -c "docker push nanobox/redis:${version}-${stability}"
ifeq ($(version),$(LATEST))
	@echo "Publishing 'redis:${stability}'..."
	@vagrant ssh -c "docker tag -f nanobox/redis nanobox/redis:${stability}"
	@vagrant ssh -c "docker push nanobox/redis:${stability}"
endif

clean:
	@echo "Removing all images..."
	@vagrant ssh -c "for image in \$$(docker images -q); do docker rmi -f \$$image; done"