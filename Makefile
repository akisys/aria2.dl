NAME = akisys/aria2.dl
VERSION = latest

.PHONY: all build

all: build

build:
	docker build -t ${NAME}:${VERSION} --rm .

deploy: build
	docker push ${NAME}:${VERSION}

run: build
	docker run -it --rm ${NAME}:${VERSION} ${ARGS}
