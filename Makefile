install:
	sudo apt-get update
	sudo apt-get -y install --no-install-recommends python-virtualenv python3-distutils python3-pyaudio ffmpeg
	sudo apt-get install docker-compose

environment:
	pyenv local 3.7.0
	virtualenv --python=python3.7 .venv && source .venv/bin/activate
	python -m pip install -U pip wheel setuptools

package:
	python setup.py bdist_wheel
	python setup.py clean --all bdist_wheel

build: install environment package