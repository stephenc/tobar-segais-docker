FROM tomcat:9.0-jre8-alpine

ENV TOBAR_SEGAIS_VERSION 1.16

ENV TOBAR_SEGAIS_URL https://repo.maven.apache.org/maven2/org/tobarsegais/tobar-segais-webapp/$TOBAR_SEGAIS_VERSION/tobar-segais-webapp-$TOBAR_SEGAIS_VERSION.war

RUN set -x \
    \
    && apk add --no-cache --virtual .fetch-deps \
            ca-certificates \
            tar \
            openssl \
    && rm -rvf /usr/local/tomcat/webapps/* \
    && wget -O ROOT.war "$TOBAR_SEGAIS_URL" \
    && mkdir -p /usr/local/tomcat/webapps/ROOT \
    && unzip ROOT.war -d /usr/local/tomcat/webapps/ROOT \
    && rm ROOT.war \
    && apk del .fetch-deps
