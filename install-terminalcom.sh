#!/bin/bash

# Provisioning script to be run on "iPython4 Notebook - Jupyter" Snap on Terminal.com
# (see https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b)
# as root from /root

echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..." # a.k.a. "papibox"

# Install pandas and scikit-learn
pip install -U scipy pandas scikit-learn

# Install BigML API wrappers and CLI tool
pip install bigml
pip install bigmler

# Install papiseval
git clone https://github.com/louisdorard/papiseval.git

echo "bml-base is installed!"
