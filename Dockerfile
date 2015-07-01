FROM alpine:3.2

RUN apk -U add ca-certificates python python-dev py-pip build-base && \
    pip install locustio pyzmq && \
    apk del python-dev && \
    rm -r /var/cache/apk/* && \
    mkdir /locust

WORKDIR /locust

ONBUILD ADD . /locustscripts
ONBUILD test -f requirements.txt && pip install -r requirements.txt

EXPOSE 8089 5557 5558
ENTRYPOINT [ "/usr/bin/locust" ]
