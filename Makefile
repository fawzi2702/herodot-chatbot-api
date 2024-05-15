IMAGE_NAME = metrics-chatbot-api
CONTAINER_NAME = $(IMAGE_NAME)_container

ENV_FILE = .env

DEFAULT_PORT = 5000

PORT = $(shell grep -E '^API_PORT=' $(ENV_FILE) | cut -d '=' -f 2)

ifeq ($(PORT),)
  PORT = $(DEFAULT_PORT)
endif

.PHONY: all
all: build

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: run-dev
run-dev:
	python3 run.py

.PHONY: run
run:
	docker run -d -p $(PORT):$(PORT) --env-file .env  --name $(CONTAINER_NAME) $(IMAGE_NAME)

.PHONY: logs
logs:
	docker logs $(CONTAINER_NAME)

.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

.PHONY: install
install:
	pip3 install -r requirements.txt

.PHONY: clean
clean:
	docker system prune -f

.PHONY: help
help:
	@echo "  build   - Build Docker image"
	@echo "  run     - Run Docker container"
	@echo "  stop    - Stop and remove Docker container"
	@echo "  install - Install Python dependencies"
	@echo "  clean   - Remove unused Docker resources"
