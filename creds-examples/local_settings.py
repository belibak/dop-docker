import urllib
# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'database-name',
        'USER': 'user',
        'PASSWORD': 'passwd',
        'HOST' : 'host',

    },
    'legacy': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'database-name',
        'USER': 'user',
        'PASSWORD': 'passwd',
        'HOST' : 'host',
    },
}

DEBUG = True

#Social Auth

BASE_URI = 'https://dop.com'

REST_SOCIAL_OAUTH_ABSOLUTE_REDIRECT_URI = BASE_URI + '/auth/login' # TODO: remove this line when REST_SOCIAL_OAUTH_ABSOLUTE_REDIRECT_URI appears in rl_proto2/conf/social.conf.py

SOCIAL_AUTH_GOOGLE_OAUTH2_KEY = '1234656.apps.googleusercontent.com'
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET = '654987654asd'
 
SOCIAL_AUTH_SALESFORCE_OAUTH2_KEY =  '123456798'
SOCIAL_AUTH_SALESFORCE_OAUTH2_SECRET = '654321987'


# SECURITY WARNING: don't run with debug turned on in production!

ALLOWED_HOSTS = ['*']
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')


# RabbitMQ Settings
BROKER_URL = 'amqp://dop:dop@rabbit:5672//'


###############################################################################
# Django storage settings
###############################################################################
# DEFAULT_FILE_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
AWS_ACCESS_KEY_ID = ''
AWS_SECRET_ACCESS_KEY = ''
AWS_STORAGE_BUCKET_NAME = ''

#Websockets settings
WS_SERVER_IP = 'websockets'
WS_SERVER_PORT = '8283'


