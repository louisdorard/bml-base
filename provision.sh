# When using vagrant, this provisioning script should be run by the 'vagrant' user

echo "Provisioning the Bootstrapping Machine Learning base box (bml-base)..."

# Base stuff
####

# Make sure we're up to date
echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
sudo apt-get update && apt-get upgrade -y

# optional package installations
# * vim for text editing from the shell
# * git for when we need to git clone repos (but versioning would be done from the host, not the VM)
# * zsh (to use oh-my-zsh)
# * s3cmd
# * curl (to perform API requests and to download stuff)
sudo apt-get install -y wget git vim zsh s3cmd curl


# Conda stuff
####

# Install "mini" anaconda python distribution (python 2.7) and a couple of packages
wget http://repo.continuum.io/miniconda/Miniconda-3.5.2-Linux-x86_64.sh
mkdir /work
/bin/bash Miniconda-3.5.2-Linux-x86_64.sh -b -p /work/anaconda/
rm Miniconda-3.5.2-Linux-x86_64.sh
/work/anaconda/bin/conda update conda --yes
/work/anaconda/bin/conda install pandas scikit-learn --yes
echo "export PATH=\"\$PATH:/work/anaconda/bin\"" >> ~/.zshrc
echo "export PATH=\"\$PATH:/work/anaconda/bin\"" >> ~/.bashrc
source ~/.bashrc

# IPython notebooks
conda install ipython-notebook --yes
mkdir -p /notebooks
echo "alias ipynb='ipython notebook --ip=0.0.0.0 /notebooks/'" >> ~/.zshrc
echo "alias ipynb='ipython notebook --ip=0.0.0.0 /notebooks/'" >> ~/.bashrc

# Install the pip installer which is often used to install additional packages
conda install pip --yes # or, with apt-get: apt-get install -y python-pip 


####################
#       BigML      #
####################

pip install bigml
pip install bigmler


# #########################
# # Google Prediction API #
# #########################

# # install Google API Python client
# pip install --upgrade google-api-python-client

# # install gsutil to upload stuff to Google Cloud Storage
# # unfortunately, `pip install -U gsutil` is unstable, so we install it "old-school" (see https://developers.google.com/storage/docs/gsutil_install)
# wget http://storage.googleapis.com/pub/gsutil.tar.gz
# sudo mv gsutil.tar.gz /usr/lib
# sudo tar xfz /usr/lib/gsutil.tar.gz -C /usr/lib/
# echo "export PATH=\"\$PATH:/usr/lib/gsutil\"" >> ~/.zshrc
# echo "export PYTHONPATH=${PYTHONPATH}:/usr/lib/gsutil/third_party/boto:/usr/lib/gsutil" >> ~/.zshrc
# source ~/.zshrc

# # apt-get install python-socksipy
# # pip install retry_decorator
# # @todo: what's that? where does it say we need it?

echo "... and we're done!"
