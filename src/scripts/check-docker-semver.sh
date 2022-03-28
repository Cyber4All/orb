#!/usr/bin/env bash

set -o nounset # exit script if unset variable is used
set -o errexit # exit script if statement returns a non-true return value
set -o pipefail # use erorr status of first failure, rather than last item in pipeline

check_version() {
    if curl --silent -f -lSL "https://index.docker.io/v1/repositories/cyber4all/${DOCKER_REPOSITORY}/tags/${DOCKER_SEMVER}" > /dev/null; then
        echo "${DOCKER_SEMVER} already exists in the ${DOCKER_REPOSITORY} on dockerhub"
        exit 1
    fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    check_version
fi