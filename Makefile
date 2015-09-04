all: image

image:
ifdef docker_user
	vagrant up
else
	export docker_user='nanobox' && vagrant up
endif

publish:
ifdef docker_user
	vagrant provision
else
	export docker_user='nanobox' && vagrant provision
endif

push_30_stable:
  vagrant ssh -c "docker push nanobox/redis"
  vagrant ssh -c "docker push nanobox/redis:3.0"
  vagrant ssh -c "docker push nanobox/redis:3.0-stable"

push_30_beta:
  vagrant ssh -c "docker push nanobox/redis:3.0-beta"

push_30_alpha:
  vagrant ssh -c "docker push nanobox/redis:3.0-alpha"

clean:
	vagrant destroy -f
