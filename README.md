bml-base
========

Provisioning of a base box for using Prediction APIs as introduced in [Bootstrapping Machine Learning](http://www.louisdorard.com/machine-learning-book).

## On Ubuntu 14.04

First, you need Jupyter. You can install it with:

> wget https://raw.githubusercontent.com/terminalcloud/apps/master/ipython-ntb4_installer.sh && bash ipython-ntb4_installer.sh

If you use Terminal.com, you can just use the [IPython4 Notebook - Jupyter Snap](https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b).

By convention I am putting all the resources in /work. Create it as a new directory if it doesn't exist in your machine (or create an alias to an existing directory). This will be the root of the Jupyter server and where you will place all code repos.

I recommend to clone this repo in /work:

> git clone https://github.com/louisdorard/bml-base.git

You can then install everything using the dedicated script in this repo:

> bash bml-base/install-terminalcom.sh

After the instal procedure you should be able to connect to the Jupyter server in your browser (port 8888).

## Credentials (optional)

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
