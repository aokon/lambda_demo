# Lambda Demo

Sample aws lambda project where you can find:

* based project layout
* setup for spec
* docker image

## Run via docker

If you want to start lamda via docker, make following steps:

* Build image for mac

  `docker build --platform linux/arm64 -t lambda_demo:1.0 .`

* Build image for linux

  `docker build --platform linux/amd64 -t lambda_demo:1.0 .`

* start lambda service

`docker run -p 9000:8080 lambda_demo:1.0`

* make example call via curl e.g

```
 curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{ "message": "hello world!"}'
```

## Run via irb

You can load app via irb session e.g

```
irb -r ./lib/lambda_demo
```

