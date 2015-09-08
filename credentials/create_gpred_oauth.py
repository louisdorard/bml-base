import json
from oauth2client import tools, file, client

STORAGE = file.Storage('gpred_oauth.json') #local storage of oAuth tokens
with open('gpred_service_account.json') as f:
    account = json.loads(f.read())
    email = account['client_email']
    key = account['private_key']
    scope = [
      'https://www.googleapis.com/auth/prediction',
      'https://www.googleapis.com/auth/devstorage.full_control'
    ]

credentials = client.SignedJwtAssertionCredentials(email, key, scope=scope)
STORAGE.put(credentials)
