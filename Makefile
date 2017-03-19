run: build
	docker run -v /etc/localtime:/etc/localtime:ro \
		--name mutt \
		-ti \
		--rm \
		-t mutt

build:
	docker build -t mutt .

clean:
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)

