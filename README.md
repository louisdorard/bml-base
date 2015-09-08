bml-base
========

Provisioning of a base box for using Prediction APIs as introduced in [Bootstrapping Machine Learning](http://www.louisdorard.com/machine-learning-book).

## Install on Terminal.com

Starting from the [IPython4 Notebook - Jupyter Snap](https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b):

* Create /work as a new directory (or an alias to an existing directory) which will be the root of the Jupyter server and where you will place all code repos
* Execute the following command as root from /work:

> git clone https://github.com/louisdorard/bml-base.git ; bash bml-base/install-terminalcom.sh

* Navigate browser to IPython server, directory /work/bml-base/credentials

## Credentials

Setup your API credentials from the Bash notebook credentials/Setup.ipynb

## Contents

* install-terminalcom.sh: script used to install all the necessary software
* \*.ipynb: some IPython notebook tutorials to get started
* credentials/: directory where your API credentials should be stored

## Learn more

Learn how to use Prediction APIs to [bootstrap Machine Learning](http://www.louisdorard.com/machine-learning-book).

Check out these notebooks:

- Introduction to Python Programming in [scientific-python-lectures](https://github.com/jrjohansson/scientific-python-lectures)
- [Diving into Open Data with IPython Notebook & Pandas](http://nbviewer.ipython.org/github/jvns/talks/blob/master/pyconca2013/pistes-cyclables.ipynb)
