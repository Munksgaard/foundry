FROM alpine:latest

RUN apk add --update nodejs unzip

RUN mkdir -p /foundryvtt /foundrydata

WORKDIR /foundryvtt

COPY foundryvtt.zip ./foundryvtt.zip

RUN unzip foundryvtt.zip

VOLUME ["/foundrydata"]

CMD ["/usr/bin/node","resources/app/main.js","--dataPath=/foundrydata"]
