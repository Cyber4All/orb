setup() {
    source ./src/scripts/check-docker-semver.sh
}

teardown() {
    rm -rf /tmp/shellcheck.log
}

@test '1: Check Semantic Version on Dockerhub' {
    export DOCKER_REPOSITORY="bundling-monitor-service"
    export DOCKER_SEMVER="latest"

    check_version
}