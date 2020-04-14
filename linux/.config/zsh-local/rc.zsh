export BROWSER='xdg-open'

docker_clean() {
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q) -f
	docker volume rm $(docker volume ls -q) -f
}

