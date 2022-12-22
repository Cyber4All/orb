# Cyber4All Orb

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Cyber4All/orb/tree/releases.svg?style=shield)](https://dl.circleci.com/status-badge/redirect/gh/Cyber4All/orb/tree/releases) [![CircleCI Orb Version](https://badges.circleci.com/orbs/cyber4all/orb.svg)](https://circleci.com/orbs/registry/orb/cyber4all/orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/cyber4all/orb/master/LICENSE)

---

## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/cyber4all/orb) - The official registry page of this orb for all versions, executors, commands, and jobs described.
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

### Contributing

* Pick up a story on shortcut

* Create a branch based on shortcut story (links shortcut and github)

* Open a pull request when ready for review

The orb should have a new semantic version for each release

```console
# writes a new semver to VERSION
$ ./version.sh -w 2.0.0
Succesfully Updated Version to 2.0.0
```

* Merge into the base branch (`main` or `hotfix`)

### Publishing a new release

* Open a pull request from `main` or `hotfix` to `releases`

* Check to make sure a new SEMVER exists in the VERSION file

* Merge branch into `releases`

This will automatically generate a new tagged release on github and publish the orb to the circleci registry.
