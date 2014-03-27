echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..."

# @todo: install oh-my-zsh?
apt-get update

# in case we need to git-clone repos (but versioning would be done from the host, not the VM)
apt-get install -y git-core


####################
# Ipython Notebook #
####################

# @todo: install anaconda instead (for access to scipy, numpy, scikit-learn, etc.; should also contain the packages below)?
apt-get install -y python-pip ipython-notebook
pip install ipython --upgrade

# Jinja is required for ipython notebook to work (see http://ipython.org/ipython-doc/stable/install/install.html)
pip install jinja2 


####################
#       BigML      #
####################

pip install bigml


#########################
# Google Prediction API #
#########################

# install Google API Python client
pip install --upgrade google-api-python-client

# install gsutil to upload stuff to Google Cloud Storage
# unfortunately, `pip install -U gsutil` is unstable, so we install it "old-school" (see https://developers.google.com/storage/docs/gsutil_install)
wget http://storage.googleapis.com/pub/gsutil.tar.gz
mv gsutil.tar.gz /usr/lib
tar xfz /usr/lib/gsutil.tar.gz -C /usr/lib/
echo "export PATH=${PATH}:/usr/lib/gsutil" >> .bashrc
echo "export PYTHONPATH=${PYTHONPATH}:/usr/lib/gsutil/third_party/boto:/usr/lib/gsutil" >> .bashrc

apt-get install python-socksipy # @todo: what's that? where does it say we need it?
pip install retry_decorator # @todo: what's that? where does it say we need it?


#########################
#      Scikit-Learn     #
#########################

# installing dependencies
apt-get -y install build-essential python-dev python-numpy python-setuptools python-scipy libatlas-dev libatlas3gf-base

# installing scikit-learn
pip install -U scikit-learn

echo "... and we're done!"
