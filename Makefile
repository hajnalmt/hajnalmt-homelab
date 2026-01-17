# Makefile for Hugo development
IMAGE_NAME = hajnalmt-homelab-dev
CONTAINER_NAME = hajnalmt-homelab-site

up:
	docker build -t $(IMAGE_NAME) -f dev.Dockerfile .
	docker run --rm -it -p 1313:1313 --name $(CONTAINER_NAME) -v $$(pwd):/src $(IMAGE_NAME)

down:
	docker stop $(CONTAINER_NAME) || true

logs:
	docker logs -f $(CONTAINER_NAME)
