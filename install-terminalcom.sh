#!/bin/bash

# Provisioning script to be run on "iPython4 Notebook - Jupyter" Snap on Terminal.com
# (see https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b)
# as root from /root

echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..." # a.k.a. "papibox"

# Install pandas and scikit-learn
apt-get install -y python-pandas python-sklearn

# Install BigML API wrappers and CLI tool
pip install bigml
pip install bigmler

# Install Bash Kernel for IPython / Jupyter
# (adapted from https://github.com/takluyver/bash_kernel)
pip install bash_kernel
python -m bash_kernel.install
service jupyter restart

# Install papiseval
git clone https://github.com/louisdorard/papiseval.git

clear

echo "bml-base is installed!"
echo "Start by browsing notebook credentials/Setup.ipynb to set up your API credentials"
