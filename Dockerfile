FROM node:latest AS web-dist

WORKDIR /webwork

COPY web .
RUN npm install
RUN npm run build-only

FROM golang:latest AS build

WORKDIR /gowork

ARG GOPROXY
ARG CGO_ENABLED=0

COPY . .
COPY --from=web-dist /webwork/dist webdist

RUN echo $(git rev-parse HEAD) >internal/version/commit

RUN go build -v -o . ./...

FROM alpine:latest

WORKDIR /app
EXPOSE 9097

ENV PATH=$PATH:/app

COPY --from=build /gowork/gofs-webui .

WORKDIR /workspace