RUN = docker-compose run --rm app

down:
	docker-compose down

clean: down
	rm -rf venv

venv:
	${RUN} python -m venv venv

setup: venv
	${RUN} venv/bin/pip install -U pip -r requirements.txt

sh:
	${RUN} sh

py:
	${RUN} venv/bin/python

run:
	${RUN} venv/bin/python main.py

podman:
	podman machine stop podman-machine-default || true
	podman machine rm podman-machine-default --force || true
	podman machine init -v "$(shell pwd):$(shell pwd)"
	podman machine start
