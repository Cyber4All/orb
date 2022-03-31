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
    
    echo "$BATS_RUN_COMMAND" >&3
    echo "$status" >&3
    echo "$output" >&3

    [ "$status" -eq 0 ]
    [ "$output" = "curl: (22) The requested URL returned error: 404 NOT FOUND" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}

@test '2: Check Semantic Version Passes' {
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="latest"

    run check_version

    echo "$BATS_RUN_COMMAND" >&3
    echo "$status" >&3
    echo "$output" >&3

    [ "$status" -eq 1 ]
    [ "$output" = "$DOCKER_SEMVER already exists in the $DOCKER_REPOSITORY on dockerhub" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}

@test '3: Unset Variable DOCKER_SEMVER Fail Case' {
    export DOCKER_REPOSITORY="bundling-monitor-service"

    run check_version

    echo "$BATS_RUN_COMMAND" >&3
    echo "$status" >&3
    echo "$output" >&3

    [ "$status" -eq 1 ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}

@test '4: Unset Variable DOCKER_REPOSITORY Fail Case' {
    export DOCKER_SEMVER="latest"

    run check_version

    echo "$BATS_RUN_COMMAND" >&3
    echo "$status" >&3
    echo "$output" >&3

    [ "$status" -eq 1 ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}
