#!/usr/bin/env bats

setup() {
    source ./src/scripts/check-docker-semver.sh
}

teardown() {
    rm -rf /tmp/shellcheck.log
}

@test '1: Check Semantic Version on Dockerhub' {
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="0.0.0"

    run check_version
    echo "$BATS_RUN_COMMAND"
    echo "$result"
    echo "$output"
    
    [ "$output" = "curl: (22) The requested URL returned error: 404 NOT FOUND" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}
