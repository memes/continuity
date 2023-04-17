FROM alpine:3.17.2 as ca
RUN apk --no-cache add ca-certificates-bundle=20220614-r4

FROM scratch
COPY --from=ca /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
EXPOSE 8080
COPY continuity /continuity
ENTRYPOINT ["/continuity"]
