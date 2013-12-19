# Revisor

### Configuration

``` yml

revisor:
    notify_on_failures: 100 # number of consecutive failures when notification will be sent
client:
    uri: http://youtube.com/ # uri of the site to watch for
validator:
    codes: # allowed status codes
        - 200
        - 301
        - 302
        - 304
    min_time: 0.11 # minimal response time
notifier:
    notify_with: # which transport you will use for alerting
        - email
        - sms
    transport:
        email: # email transport configuration
            from: alert@revisor.com
            subject: youtube.com site watching
            to: vbuzrvcd@sharklasers.com
        sms: # sms transport configuration, cause i have no app_key & app_secret i haven't tested it...
            api_key: asdfasdfasdfasdf
            api_secret: qwerqwerqwerqwerqwerqwer
            phone_number: +375291111111
            from: revisor_app

```
