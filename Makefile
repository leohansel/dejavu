env:
	pyenv local 3.7.0
	virtualenv --python=python3.7 venv && source venv/bin/activate
	python -m pip install -U pip wheel setuptools

package:
	python setup.py bdist_wheel
	python setup.py clean --all bdist_wheel