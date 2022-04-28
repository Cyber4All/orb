#!/usr/bin/env bats

setup() {
    source ./src/scripts/check-docker-semver.sh
}

teardown() {
    rm -rf /tmp/shellcheck.log
}

print_output() {
    echo "$BATS_RUN_COMMAND"
    echo "$status"
    echo "$output"
}

@test 'Check Semantic Version on Dockerhub' {
    export DOCKER_ORGANIZATION="cyber4all"
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="0.0.0"

    run check_version

    [ "$status" -eq 0 ]
    [ "$output" = "curl: (22) The requested URL returned error: 404 NOT FOUND" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test 'Check Semantic Version Passes' {
    export DOCKER_ORGANIZATION="cyber4all"
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="latest"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "$DOCKER_SEMVER already exists in the $DOCKER_REPOSITORY on dockerhub" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test 'Unset Variable DOCKER_SEMVER Fail Case' {
    export DOCKER_ORGANIZATION="cyber4all"
    export DOCKER_REPOSITORY="bundling-monitor-service"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "./src/scripts/check-docker-semver.sh: line 6: DOCKER_SEMVER: unbound variable" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}

@test 'Unset Variable DOCKER_REPOSITORY Fail Case' {
    export DOCKER_ORGANIZATION="cyber4all"
    export DOCKER_SEMVER="latest"

    run check_version

    [ "$status" -eq 1 ]
    [ "$output" = "./src/scripts/check-docker-semver.sh: line 6: DOCKER_REPOSITORY: unbound variable" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]

    print_output
}
