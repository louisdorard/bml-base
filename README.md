bml-base
========

Provisioning of a base box for using Prediction APIs as introduced in [Bootstrapping Machine Learning](http://www.louisdorard.com/machine-learning-book).

## Instal on Terminal.com

Starting from the [Official Ubuntu 14.04 Snap](https://www.terminal.com/snapshot/987f8d702dc0a6e8158b48ccd3dec24f819a7ccb2756c396ef1fd7f5b34b7980), the instal steps are:

> mkdir /work

> cd /work

> apt-get install -y git

> git clone https://github.com/louisdorard/bml-base.git

> bml-base/provision.sh

> ln -s /work/bml-base/ipynb /notebooks/bml-base

## Instal on Vagrant -- not maintained anymore

The [Vagrant](http://vagrantup.com/) box is available at https://vagrantcloud.com/louisdorard/bml-base and it uses Virtualbox as a provider.

### How to recreate the box

First of all, create and provision the Virtual Machine:
> vagrant up

You can then package it into a box. Instructions on how to create a base box at https://docs.vagrantup.com/v2/virtualbox/boxes.html. Essentially once the VM has been created with Virtualbox you just launch:
> vagrant package --base bml-base

## Contents

* provision.sh: script used to provision the base box and instal all the necessary software
* ipynb/: some IPython notebook tutorials to get started
* Vagrantfile: config file for Vagrant -- not maintained anymore
* Dockerfile: work in progress...

## Learn more

Learn how to use Prediction APIs to [bootstrap Machine Learning](http://www.louisdorard.com/machine-learning-book).
