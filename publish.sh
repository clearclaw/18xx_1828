#! /bin/bash

set -e

ARG="${1}"
GAMENAME=1828

if [ -n "${ARG}" ]
then
  ./gitinfo_install
fi

./build.sh 
pushd build
  chmod 644 *
  rsync -ra --delete * claw@kanga.nu:~/public_html/${GAMENAME}/
popd
