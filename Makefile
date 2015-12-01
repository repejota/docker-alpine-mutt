run: build
	docker run -v `pwd`:/src -ti --rm -t mutt

build:
	docker build -t mutt .

clean:
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)

