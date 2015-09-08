image:
	vagrant up
	vagrant ssh -c "sudo docker build -t nanobox/redis /vagrant"

tag:
	vagrant ssh -c "sudo docker tag nanobox/redis nanobox/redis:3.0"
	vagrant ssh -c "sudo docker tag nanobox/redis nanobox/redis:3.0-stable"
	vagrant ssh -c "sudo docker tag nanobox/redis nanobox/redis:3.0-beta"
	vagrant ssh -c "sudo docker tag nanobox/redis nanobox/redis:3.0-alpha"

# image28:
# 	vagrant up
# 	vagrant ssh -c "sudo docker build -t nanobox/redis:2.8 -f Dockerfile_28 /vagrant"
# tag28:
# 	vagrant ssh -c "sudo docker tag nanobox/redis:2.8 nanobox/redis:2.8-stable"
# 	vagrant ssh -c "sudo docker tag nanobox/redis:2.8 nanobox/redis:2.8-beta"
# 	vagrant ssh -c "sudo docker tag nanobox/redis:2.8 nanobox/redis:2.8-alpha"

all: image tag image28 tag28

publish:
	vagrant provision

push_30_stable:
	vagrant ssh -c "sudo docker push nanobox/redis"
	vagrant ssh -c "sudo docker push nanobox/redis:3.0"
	vagrant ssh -c "sudo docker push nanobox/redis:3.0-stable"

push_30_beta:
	vagrant ssh -c "sudo docker push nanobox/redis:3.0-beta"

push_30_alpha:
	vagrant ssh -c "sudo docker push nanobox/redis:3.0-alpha"

clean:
	vagrant destroy -f
