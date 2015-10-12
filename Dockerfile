# Adapted from Jupyter Development Team.
# the image below has the advantage of being smaller than Ubuntu, but we should check that the rest still works in Debian...
FROM ubuntu:14.04

RUN mkdir /work
WORKDIR /work

RUN bash ipython-ntb4_installer.sh

# Use custom Jupyter config files (home is defined as /work instead of /root)
RUN cp jupyter.conf /etc/init/
RUN cp ipython_config.py /root/.ipython/profile_nbserver/

## Install Bash kernel
RUN pip install bash_kernel
RUN python -m bash_kernel.install

RUN service jupyter restart
