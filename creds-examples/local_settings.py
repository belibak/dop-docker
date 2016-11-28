import urllib
# Database
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'database',
        'USER': 'username',
        'PASSWORD': 'password',
        'HOST' : 'host.com',

    },
    'legacy': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'database',
        'USER': 'username',
        'PASSWORD': 'password',
        'HOST' : 'host.com',
    },
}

DEBUG = True


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
ALLOWED_HOSTS = ['*']
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')


# RabbitMQ Settings
BROKER_URL = 'amqp://dop:dop@rabbit:5672//'

###############################################################################
# Django storage settings
###############################################################################
AWS_ACCESS_KEY_ID = 'keyid'
AWS_SECRET_ACCESS_KEY = 'secret key'
AWS_STORAGE_BUCKET_NAME = 'bucket-name'

#Websockets settings
WS_SERVER_IP = 'websockets'
WS_SERVER_PORT = '8283'


