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
