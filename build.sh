#!/usr/bin/env bash

IMAGE_VERSION="api-23"

docker build -t luanngominh/android-flutter:${IMAGE_VERSION} .
docker push luanngominh/android-flutter:${IMAGE_VERSION}

