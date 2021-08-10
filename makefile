
.PHONY: build
build:
	docker build \
	   -t kooose/ml-system-in-actions:template_0.0.1 \
		. 		.
	 
.PHONY: run
run:
	docker run \
		-d \
		--name $(TEMPLATE_PATTERN) \
		-p $(TEMPLATE_PATTERN_PORT):$(TEMPLATE_PATTERN_PORT) \
		$(DOCKER_REPOSITORY):$(TEMPLATE_PATTERN)_$(IMAGE_VERSION)

.PHONY: stop
stop:
	docker rm -f $(TEMPLATE_PATTERN)

.PHONY: push
push:
	docker push $(DOCKER_REPOSITORY):$(TEMPLATE_PATTERN)_$(IMAGE_VERSION)

.PHONY: build_all
build_all: build

.PHONY: run_all
run_all: run

.PHONY: push_all
push_all: push
