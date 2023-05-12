SHELL := /bin/bash

.PHONY: all
all: run

.PHONY: help
help: ## This help overview
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: init
init: ## Init Swarm Cluster if it not exists
	@bash ./init.sh

.PHONY: secrets
secrets: ## Make secret files from .env
	@bash ./secrets.sh

.PHONY: run-only
run-only: ## Run application in Docker Compose
	@bash ./deploy.sh traefik portainer registry graphite loki promtail grafana whoami

.PHONY: traefik-acme
traefik-acme: ## Create acme.json and set permissions to 0600
	@bash ./traefik/acme.sh

.PHONY: run
run : secrets init traefik-acme run-only

.PHONY: up
up : run

.PHONY: down
down: ## Docker Compose down
	@bash ./undeploy.sh traefik portainer registry graphite loki promtail grafana whoami

.PHONY: again
again : down run-only

.PHONY: traefik-localhost
traefik-localhost: ## Make localhost certificates
	@bash ./traefik/localhost.sh

.PHONY: logrotate
logrotate: ## Makes logrotate configs for logs
	@bash ./logrotate.sh

.PHONY: disk-usage
disk-usage: ## Prints disk usage by predefined directories
	@sudo du -hs graphite/data loki/data portainer/data promtail/positions registry/data jaeger/data /var/log

.PHONY: go-env
go-env: ## Add Go binaries to PATH making it accessible after `go install ...`
	@export PATH="$PATH:$(go env GOPATH)/bin"

.PHONY: postgres
postgres: ## deploy postgres
	@bash ./deploy.sh postgres

.PHONY: jaeger
jaeger: ## deploy jaeger all-in-one
	@bash ./deploy.sh jaeger

.PHONY: root
root: ## deploy root
	@bash ./deploy.sh root
