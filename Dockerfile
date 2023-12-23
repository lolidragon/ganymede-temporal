FROM alpine:latest

RUN apk add curl

WORKDIR /tmp

RUN curl "https://temporal.download/cli/archive/latest?platform=linux&arch=amd64" -o temporal_cli.tar.gz

RUN tar -xzf temporal_cli.tar.gz

RUN mv temporal /usr/local/bin/temporal && chmod +x /usr/local/bin/temporal

RUN rm temporal_cli.tar.gz

CMD ["temporal", "server", "start-dev", "--db-filename", "/data/temporal.db", "--ip", "0.0.0.0"]