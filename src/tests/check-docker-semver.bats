#!/usr/bin/env bats

setup() {
    source ./src/scripts/check-docker-semver.sh
}

teardown() {
    rm -rf /tmp/shellcheck.log
}

print_output() {
    echo "$BATS_RUN_COMMAND" >&3
    echo "$status" >&3
    echo "$output" >&3
}

@test '1: Check Semantic Version on Dockerhub' {
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="0.0.0"

    run check_version

    [ "$status" -eq 0 ]
    [ "$output" = "curl: (22) The requested URL returned error: 404 NOT FOUND" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test '2: Check Semantic Version Passes' {
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="latest"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "$DOCKER_SEMVER already exists in the $DOCKER_REPOSITORY on dockerhub" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test '3: Unset Variable DOCKER_SEMVER Fail Case' {
    export DOCKER_REPOSITORY="bundling-monitor-service"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "./src/scripts/check-docker-semver.sh: line 6: DOCKER_SEMVER: unbound variable" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test '4: Unset Variable DOCKER_REPOSITORY Fail Case' {
    export DOCKER_SEMVER="latest"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "./src/scripts/check-docker-semver.sh: line 6: DOCKER_REPOSITORY: unbound variable" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}
