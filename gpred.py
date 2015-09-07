# Gpred: authenticates into the Google Prediction API and returns an object to use to issue requests to the API.
#
# This adapted from https://gist.github.com/alexcasalboni/cf11cc076ad70a445612
# Also check out sample.py in the starter application provided by https://developers.google.com/api-client-library/python/ when selecting the Prediction API in Command Line at the bottom of that page, for inspiration...

import httplib2, argparse, os, sys, json
from oauth2client import tools, file, client
from googleapiclient import discovery
from googleapiclient.errors import HttpError


def api(path):

    """ Build API client based on oAuth2 authentication """
    STORAGE = file.Storage(path) #local storage of oAuth tokens
    credentials = STORAGE.get()
    if credentials is None or credentials.invalid: #check if new oAuth flow is needed
      credentials = create_oauth_tokens()

    #wrap http with credentials
    http = credentials.authorize(httplib2.Http())
    api = discovery.build('prediction', "v1.6", http=http)

    try:
        return api

    except client.AccessTokenRefreshError:
        print ("The credentials have been revoked or expired, please re-run"
          "the application to re-authorize")
