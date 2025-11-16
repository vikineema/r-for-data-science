#!make
SHELL := /usr/bin/env bash


build:
	docker compose build

up: ## Bring up your Docker environment
	docker compose up -d jupyterlab

down: ## Bring down your Docker environment
	docker compose down

logs: ## View logs for your Docker environment
	docker compose logs -f jupyterlab

r-console: ## Open an R console in the JupyterLab container
	docker compose exec jupyterlab R

jupyter-shell: ## Open a shell in the JupyterLab container
	docker compose exec jupyterlab /bin/bash