# This provisioning script should be run by the 'vagrant' user

echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..."

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
sudo mv gsutil.tar.gz /usr/lib
sudo tar xfz /usr/lib/gsutil.tar.gz -C /usr/lib/
echo "export PATH=\"\$PATH:/usr/lib/gsutil\"" >> ~/.bashrc
echo "export PYTHONPATH=${PYTHONPATH}:/usr/lib/gsutil/third_party/boto:/usr/lib/gsutil" >> ~/.bashrc
source ~/.bashrc

# apt-get install python-socksipy
# pip install retry_decorator
# @todo: what's that? where does it say we need it?


#####################
# Optional installs #
#####################

sudo apt-get update

# in case we need to git-clone repos (but versioning would be done from the host, not the VM)
sudo apt-get install -y git-core

# optional: install vim
sudo apt-get install -y vim

# optional: use zsh and oh-my-zsh
sudo apt-get install -y zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
sudo chsh -s /usr/bin/zsh vagrant # change shell for 'vagrant' user

echo "... and we're done!"
