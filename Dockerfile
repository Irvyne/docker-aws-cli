FROM alpine:3.10

RUN apk -v --update add \
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
