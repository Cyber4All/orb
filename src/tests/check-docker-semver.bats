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
    [ "$status" -eq 1 ]
    [ "$output" = "${DOCKER_SEMVER} already exists in the ${DOCKER_REPOSITORY} on dockerhub" ]
    [ "$BATS_RUN_COMMAND" = "check_version" ]
}