# Locust.io Docker Image [![Project Status: Inactive – The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)



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

### Run without building your own image

Alternatively, if you don't have a `requirements.txt` file, you can run a temporary, anonymous container by sharing your `locustfile.py` into it. Assuming you have a `locustfile.py` file in the current folder you're in, you can run with this command:

```
docker run --rm -v `pwd`:/locust -p 8089:8089 christianbladescb/locustio --host http://mysite
```

You will also be able to access the web interface at http://localhost:8089

## Master/Slave

If you want to run in master/slave mode, specify a different file to run, etc, you can pass the appropriate flags to the container.

```shell
$ docker run -d --name master -P mylocust -f otherlocustfile.py --host=http://foo.com --master
$ docker run -d --name slave --link master mylocust -f otherlocustfile.py --host=http://foo.com --slave --master-host=master 
```
