echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..."

# @todo: install oh-my-zsh?
apt-get update

# in case we need to git-clone repos (but versioning would be done from the host, not the VM)
apt-get install -y git-core

# configure auto start of ipynb server
cp /vagrant/autostartipynb.conf /etc/init/

# install the pip installer which is used to install the rest
conda install pip --yes # or, with apt-get: apt-get install -y python-pip 


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


echo "... and we're done!"
