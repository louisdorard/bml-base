FROM louisdorard/conda-base
MAINTAINER Louis Dorard <louis@dorard.me>

RUN conda install pip --yes


####################
#       BigML      #
####################

RUN pip install bigml
RUN pip install bigmler


#########################
# Google Prediction API #
#########################

# install Google API Python client
RUN pip install --upgrade google-api-python-client

# install gsutil to upload stuff to Google Cloud Storage
# unfortunately, `pip install -U gsutil` is unstable, so we install it "old-school" (see https://developers.google.com/storage/docs/gsutil_install)
RUN wget http://storage.googleapis.com/pub/gsutil.tar.gz
RUN mv gsutil.tar.gz /usr/lib
RUN tar xfz /usr/lib/gsutil.tar.gz -C /usr/lib/

# update paths
RUN echo "export PATH=\"\$PATH:/usr/lib/gsutil\"" >> ~/.zshrc
RUN echo "export PYTHONPATH=${PYTHONPATH}:/usr/lib/gsutil/third_party/boto:/usr/lib/gsutil" >> ~/.zshrc
