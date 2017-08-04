#!/bin/bash

set -exo pipefail

_main() {
  HADOOP_DISTRO_LOWER=$(echo ${2} | tr A-Z a-z)
  mv ${HADOOP_DISTRO_LOWER}_tars_tarball/*.tar.gz $(pwd)/singlecluster/tars/
  mv tomcat/*.tar.gz $(pwd)/singlecluster/tars/
  mv curl/*.tgz $(pwd)/singlecluster/tars/
  mv jdbc/*.jar $(pwd)/singlecluster/tars/
  pushd $(pwd)/singlecluster
    make HADOOP_VERSION="${1}" HADOOP_DISTRO="${2}"
    mv singlecluster-${2}.tar.gz ../artifacts/singlecluster-${2}.tar.gz
  popd
}

_main "$@"
