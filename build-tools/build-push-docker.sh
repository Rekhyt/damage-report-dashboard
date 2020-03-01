#!/usr/bin/env bash


DUMSTER=$(echo $dummy | base64 --decode -i)
echo $DUMSTER
docker login --username _json_key --password "$(cat ${HOME]})" https://eu.gcr.io

# amd64
buildctl build --frontend dockerfile.v0 \
            --local dockerfile=. \
            --local context=. \
            --exporter image \
            --exporter-opt name=eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 \
            --exporter-opt push=true \
            --frontend-opt platform=linux/amd64 \
            --frontend-opt filename=./Dockerfile \
            --opt build-arg:BUILD_PRODUCTION=true \
            --opt build-arg:API_URL=http://192.168.2.150


# arm
buildctl build --frontend dockerfile.v0 \
            --local dockerfile=. \
            --local context=. \
            --exporter image \
            --exporter-opt name=eu.gcr.io/rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7 \
            --exporter-opt push=true \
            --frontend-opt platform=linux/armhf \
            --frontend-opt filename=./Dockerfile \
            --opt build-arg:IMAGE=balenalib/rpi-alpine-node:latest \
            --opt build-arg:BUILD_PRODUCTION=true \
            --opt build-arg:API_URL=http://192.168.2.150


export DOCKER_CLI_EXPERIMENTAL=enabled

# manifest
docker manifest create rekhyt-damage-report/dashboard:${TRAVIS_TAG} \
            rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 \
            rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7

docker manifest annotate rekhyt-damage-report/dashboard:${TRAVIS_TAG} rekhyt-damage-report/dashboard:${TRAVIS_TAG}-armv7 --arch arm
docker manifest annotate rekhyt-damage-report/dashboard:${TRAVIS_TAG} rekhyt-damage-report/dashboard:${TRAVIS_TAG}-amd64 --arch amd64

docker manifest push rekhyt-damage-report/dashboard:${TRAVIS_TAG}