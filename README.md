It's a minimal example of how to integrate Rails's `ActionDispatch::Session::CookieStore` middleware to a another rack application.

# Usage

```
bundle install
ruby server.rb
```

```
http --print Hh --session x http://localhost:8080
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Cookie: _session_id=TFNXUGljZ3YwQUp6T3FCYXlNRThqcFBjc09VV1h4QlF2WEUvNjdNR1ExV3ZQNGR6cFF0eExadDU3M0NzNVRkcUw1ZTh1N2dKSGo1eHJpUGZnOXh5MVpyY2pkSk1CZmxFT0ppREc2ZElFTXM9LS10c3h1NzZueVpHSGc5QkJmZ05KZXdnPT0%3D--39af9ea81097eacf1e63b9fcd1f04275818f337a
Host: localhost:8080
User-Agent: HTTPie/0.9.2

HTTP/1.1 200 OK
Connection: Keep-Alive
Content-Length: 2
Date: Sat, 03 Dec 2016 19:16:27 GMT
Server: WEBrick/1.3.1 (Ruby/2.3.1/2016-04-26)
Set-Cookie: _session_id=N1NkdDFRaUVDSnpIY2tmTFdJS29idk5ESlQ5M2N0QkVzSlNyTWF4ZmlpUTZ2aTdsYmlOcEYvOVZhWkYvZ0FWRmRXeEQvei9OVzllYnVyakJoSkFSeGNodWw4LzBOWVozaFZnbTZIdXBlV2c9LS1OQS94RTNvbnBPa2VGS2VibSt2RFhnPT0%3D--195ff13d232b12a417c3b2aa8ff936a4b5a577c7; path=/; HttpOnly
```
