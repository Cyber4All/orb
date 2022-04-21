#!/usr/bin/env bash

set -o nounset # exit script if unset variable is used

check_version() {
    if curl --silent -f -lSL "https://index.docker.io/v1/repositories/${DOCKER_ORGANIZATION}/${DOCKER_REPOSITORY}/tags/${DOCKER_SEMVER}" > /dev/null; then
        echo "${DOCKER_SEMVER} already exists in the ${DOCKER_REPOSITORY} on dockerhub"
        exit 1
    fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    check_version
fi