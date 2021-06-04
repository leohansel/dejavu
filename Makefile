install:
	sudo apt-get update
	sudo apt-get -y install --no-install-recommends python-virtualenv python3-distutils python3-pyaudio ffmpeg
	sudo apt-get install docker-compose

env:
	pyenv local 3.7.0
	virtualenv --python=python3.7 .venv && source .venv/bin/activate
	python -m pip install -U pip wheel setuptools

package:
	python setup.py bdist_wheel
	python setup.py clean --all bdist_wheel

copy:
	cp dist/PyDejavu-0.1.3-py3-none-any.whl ../voice-ml-wakeword-verification/services/verification/python/dockers/verification/inference/

clean:
	rm -rf build dist PyDejavu.egg-info

environment: install env

build: package copy clean