bml-base
========

Provisioning of a Vagrant base box for Bootstrapping Machine Learning and using Prediction APIs. The resulting box is available at https://vagrantcloud.com/louisdorard/bml-base and it uses Virtualbox as a provider.

## How to recreate the box

@todo

First of all, create and provision the Virtual Machine:
> vagrant up

You can then package it into a box. Instructions on how to create a base box at https://docs.vagrantup.com/v2/virtualbox/boxes.html. Essentially once the VM has been created with Virtualbox you just launch:
> vagrant package --base bml-base

## Contents

* Vagrantfile: config file for Vagrant
* provision.sh: script used to provision the base box
* autostartipynb.conf: config file to be copied to /etc/init to automatically start the iPython notebook server at boot
* ipynb/: (empty) home directory for the iPython notebook server

## Learn more

Learn how to use Prediction APIs to [bootstrap Machine Learning](http://www.louisdorard.com/machine-learning-book).

Check out [Vagrant](http://vagrantup.com/) and Virtualbox .
