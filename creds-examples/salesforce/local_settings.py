CONSUMER_KEY = 'A32S1D3AS21D3A2SD13A2S1D3AS21D'
CONSUMER_SECRET = '1231231231231323132'
REDIRECT_DOMAIN = 'https://host.com' 
REDIRECT_URI = REDIRECT_DOMAIN + '/oauth/salesforce/'
#REDIRECT_URI = 'https://ip/oauth/salesforce/' #<---If you will start django and have nginx proxying on localhost:8283 
AUTH_URL_TEMPLATE = 'https://{0}.salesforce.com/services/oauth2/authorize?response_type=code&client_id={1}'\
    '&redirect_uri={2}&display=popup&prompt=login%20consent' 
SALESFORCE_PROD_AUTH_URL = AUTH_URL_TEMPLATE.format('login', CONSUMER_KEY, REDIRECT_URI) 
SALESFORCE_SANDBOX_AUTH_URL = AUTH_URL_TEMPLATE.format('test', CONSUMER_KEY, REDIRECT_URI)
