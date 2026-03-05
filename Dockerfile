FROM alpine:latest
RUN apk --no-cache add gettext
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["envsubst"]