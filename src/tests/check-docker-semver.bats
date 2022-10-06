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
