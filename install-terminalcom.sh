#!/bin/bash

# Provisioning script to be run on "iPython4 Notebook - Jupyter" Snap on Terminal.com
# (see https://www.terminal.com/snapshot/e812ebe24e3796846a0a4b930a810a45135af5fbcc5502a32526fc4c80b8e09b)
# as root from /work

echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..." # a.k.a. "papibox"

pushd /work/bml-base/

# Install pandas and scikit-learn
apt-get install -y python-pandas python-sklearn

# Install BigML API wrappers and CLI tool
pip install bigml
pip install bigmler

# Install SKLL
pip install skll

# Install Google API client
apt-get install -y libssl-dev libffi-dev # see https://cryptography.io/en/latest/installation/
apt-get install -y python-openssl # not sure this is required?
pip install cryptography
pip install google-api-python-client
cp gpred.py /usr/local/lib/python2.7/dist-packages/googleapiclient # makes it easier to create wrapper for gpred

# Install gsutil and gcs-oauth2-boto-plugin (authentication plugin for the boto auth plugin framework) to upload stuff to Google Cloud Storage
# unfortunately, `pip install -U gsutil` is unstable, so we install it "old-school" (see https://developers.google.com/storage/docs/gsutil_install)
wget http://storage.googleapis.com/pub/gsutil.tar.gz
mv gsutil.tar.gz /usr/lib
tar xfz /usr/lib/gsutil.tar.gz -C /usr/lib/
echo "export PATH=\"\$PATH:/usr/lib/gsutil\"" >> ~/.bashrc
echo "export PYTHONPATH=${PYTHONPATH}:/usr/lib/gsutil/third_party/boto:/usr/lib/gsutil" >> ~/.bashrc
pip install gcs-oauth2-boto-plugin==1.9

# Use custom Jupyter config files (home is defined as /work instead of /root)
cp jupyter.conf /etc/init/
cp ipython_config.py /root/.ipython/profile_nbserver/

# Install Bash Kernel for IPython / Jupyter
# (adapted from https://github.com/takluyver/bash_kernel)
pip install bash_kernel
python -m bash_kernel.install

service jupyter restart

popd

clear

echo "bml-base is installed!"
echo "Start by browsing notebook bml-base/credentials/Setup.ipynb to set up your API credentials"
