# Locust.io Docker Image

[![](https://badge.imagelayers.io/christianbladescb/locustio:latest.svg)](https://imagelayers.io/?images=christianbladescb/locustio:latest 'Get your own badge on imagelayers.io')

[![](http://dockeri.co/image/christianbladescb/locustio)](https://registry.hub.docker.com/u/christianbladescb/locustio)

Use [locust.io](http://locust.io/) in docker, for great portability!

## Usage

Assuming you have a `locustfile.py` in the root of your project, make a Dockerfile like this:

```dockerfile
FROM christianbladescb/locustio
```

Then build and run the docker image:

```shell
$ docker build -t mylocust .
$ docker run --rm -P mylocust
```

Any requirements you have listed in your `requirements.txt` will be installed during the build, and locust runs `locustfile.py` by default!

## Master/Slave

If you want to run in master/slave mode, specify a different file to run, etc, you can pass the appropriate flags to the container.

```shell
$ docker run -d --name master -P mylocust -f otherlocustfile.py --host=http://foo.com --master
$ docker run -d --name slave --link master -f otherlocustfile.py --host=http://foo.com --slave --master-host=master 
```
