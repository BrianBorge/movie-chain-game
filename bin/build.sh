#!/bin/bash -x

set -e

IMAGE_NAME=brianborge/movie-chain-game:latest

docker image build \
    -t $IMAGE_NAME .
