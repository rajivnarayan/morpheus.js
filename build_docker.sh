#!/bin/bash

# Docker build script for morpheus.js
set -e

BUILD_VERSION=${1:-latest}
BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
IMAGE_NAME="morpheus.js"

echo "Building Docker image: ${IMAGE_NAME}:${BUILD_VERSION}"

docker build \
  --no-cache=true \
  --build-arg BUILD_DATE="${BUILD_DATE}" \
  --build-arg BUILD_VERSION="${BUILD_VERSION}" \
  -t "${IMAGE_NAME}:${BUILD_VERSION}" \
  -t "${IMAGE_NAME}:latest" \
  .

echo "Build complete: ${IMAGE_NAME}:${BUILD_VERSION}"
echo "To run: docker run -p 3000:3000 ${IMAGE_NAME}:${BUILD_VERSION}"
