#!/usr/bin/env bash

# amd64
buildctl build --frontend dockerfile.v0 \
            --local dockerfile=. \
            --local context=. \
            --frontend-opt platform=linux/amd64 \
            --frontend-opt filename=./Dockerfile \
            --output type=docker,name=eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 \
            --opt build-arg:BUILD_PRODUCTION=false \
            --opt build-arg:API_URL=${API_URL} \
            | docker load

docker images


# arm
buildctl build --frontend dockerfile.v0 \
            --local dockerfile=. \
            --local context=. \
            --frontend-opt platform=linux/armhf \
            --frontend-opt filename=./Dockerfile \
            --output type=docker,name=eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7 \
            --opt build-arg:IMAGE=balenalib/rpi-alpine-node:latest \
            --opt build-arg:BUILD_PRODUCTION=false \
            --opt build-arg:API_URL=${API_URL} \
            | docker load

docker images

# re-tag without arch for manifest
docker tag eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}
docker images

# push to GCR
docker login --username _json_key --password "$(echo ${GC_CREDENTIALS} | base64 --decode -i)" https://eu.gcr.io
docker push eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}
docker push eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64
docker push eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7

# create manifests for architectures
export DOCKER_CLI_EXPERIMENTAL=enabled
docker manifest create eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG} \
            eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 \
            eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7

docker manifest annotate eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG} eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7 --arch arm
docker manifest annotate eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG} eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 --arch amd64

docker manifest push eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}