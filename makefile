include ../../../make.inc

build_docker_image:
	docker build -t $(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(DOCKER_IMAGE_NAME):$(IMAGE_TAG) .

run_docker_image:
	docker run -it -e PORT=$(PORT) -p 8000:$(PORT) $(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(DOCKER_IMAGE_NAME):$(IMAGE_TAG)

push_docker_image:
	docker push "$(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(DOCKER_IMAGE_NAME):$(IMAGE_TAG)"

deploy_docker_image:
	gcloud run deploy --allow-unauthenticated --image="$(HOSTNAME)/$(PROJECT_ID)/$(REPOSITORY)/$(DOCKER_IMAGE_NAME):$(IMAGE_TAG)"
