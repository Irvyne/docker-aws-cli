FROM alpine:3.10

ARG INETPSA=false

RUN if [ "$INETPSA" = "true" ] ; then \
        sed -i -e 's/http:\/\/dl-cdn\.alpinelinux\.org/http:\/\/repository.inetpsa.com\/alpine-remote/g' /etc/apk/repositories \
    ; fi

RUN apk -v --update add \
        bash \
        groff \
        jq \
        less \
        mailcap \
        python3 \
        py3-pip \
        && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade awscli s3cmd python-magic && \
    apk -v --purge del py3-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
