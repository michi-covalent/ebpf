FROM golang:1.19 as build

WORKDIR /go/src/app
COPY . .

RUN ./build.sh

# Now copy it into our base image.
FROM ubuntu:22.04
RUN apt-get update && apt-get -y install curl
COPY --from=build /go/src/app/examples /ebpf
