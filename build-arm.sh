#!/usr/bin/env sh

BUILD_PRODUCTION="${BUILD_PRODUCTION:-true}"
API_URL="${API_URL:-http://localhost:8000}"
TAG="${TAG:-latest}"

docker build \
  --build-arg BUILD_PRODUCTION=${BUILD_PRODUCTION} \
  --build-arg API_URL=${API_URL} \
  --build-arg IMAGE=balenalib/rpi-alpine-node:latest \
  -t damage-report-dashboard:${TAG}-arm \
  .