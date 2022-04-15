RUN = docker-compose run --rm app

down:
	docker-compose down

clean: down
	rm -r venv

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
	podman machine rm podman-machine-default --force
	podman machine init -v ${HOME}:${HOME}
	podman machine start
