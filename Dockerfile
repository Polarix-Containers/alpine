FROM alpine:latest

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN apk -U upgrade \
    && apk add libstdc++ \
    && rm -rf /var/cache/apk/*

COPY --from=ghcr.io/blue-oci/hardened_malloc:latest /install /usr/local/lib/

ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"
