FROM alpine:3.11

RUN apk -v --update add \
        bash \
        curl \
        groff \
        jq \
        less \
        mailcap \
        python3 \
        && \
    pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir --upgrade awscli s3cmd && \
    rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
