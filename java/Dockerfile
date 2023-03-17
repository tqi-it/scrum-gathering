FROM openjdk:17-alpine

RUN apk add bash

RUN mkdir -p /java

COPY ./ java/

WORKDIR /java/mentorme/

COPY script.sh /usr/bin/

RUN chmod +x /usr/bin/script.sh

ENTRYPOINT ["script.sh"]