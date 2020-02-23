#!/usr/bin/env sh

BUILD_PRODUCTION="${BUILD_PRODUCTION:-true}"
API_URL="${API_URL:-http://localhost:8000}"
TAG="${TAG:-development}"

docker build --build-arg BUILD_PRODUCTION=${BUILD_PRODUCTION} --build-arg API_URL=${API_URL} -t damage-report-dashboard:${TAG} .