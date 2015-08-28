bml-base
========

Provisioning of a base box for using Prediction APIs as introduced in [Bootstrapping Machine Learning](http://www.louisdorard.com/machine-learning-book).

## Install on Terminal.com

Starting from the [IPython4 Notebook - Jupyter Snap](https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b), execute the following command as root from /root:

> git clone https://github.com/louisdorard/bml-base.git ; bash bml-base/install-terminalcom.sh


## Install on Vagrant -- not maintained anymore

The [Vagrant](http://vagrantup.com/) box is available at https://vagrantcloud.com/louisdorard/bml-base and it uses Virtualbox as a provider.

### How to recreate the box

First of all, create and provision the Virtual Machine:
> vagrant up

You can then package it into a box. Instructions on how to create a base box at https://docs.vagrantup.com/v2/virtualbox/boxes.html. Essentially once the VM has been created with Virtualbox you just launch:
> vagrant package --base bml-base

## Contents

* provision.sh: script used to provision the base box and install all the necessary software
* ipynb/: some IPython notebook tutorials to get started
* Vagrantfile: config file for Vagrant -- not maintained anymore
* Dockerfile: work in progress...

## Learn more

Learn how to use Prediction APIs to [bootstrap Machine Learning](http://www.louisdorard.com/machine-learning-book).
