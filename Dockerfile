FROM alpine:3.16

RUN apk add --no-cache \
    curl \
    restic \
    unzip \
    bash \
    postgresql-client

# Follow redirects with -L
RUN curl -L https://github.com/ameyp/vault-raft-snapshotter/releases/download/0.1.4/vault-snapshot -o /usr/bin/vault-snapshot
RUN chmod +x /usr/bin/vault-snapshot
COPY restic-backup.sh /restic-backup.sh
COPY pgdump.sh /pgdump.sh
