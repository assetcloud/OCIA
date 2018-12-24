.PHONY: all
IMAGE_URL=dockerhub.qingcloud.com/tsnginx/timestamp-nginx
TAG_LATEST=latest

build:
	@echo ${TAG_CURRENT}
	docker build -t $(IMAGE_URL):$(TAG_LATEST) src/ -f docker/Dockerfile

install:
	kubectl run ts-nginx --image=wangxinsh/timestamp-nginx:latest
	kubectl expose deploy ts-nginx --type=NodePort --port=80 --target-port=80

uninstall:
	kubectl delete deploy ts-nginx
	kubectl delete svc ts-nginx
