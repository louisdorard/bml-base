FROM jupyter/scipy-notebook
MAINTAINER Louis Dorard <louis@dorard.me>

####################
#       BigML      #
####################

RUN pip install bigml
RUN pip install bigmler
