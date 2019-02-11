#! /bin/bash

set -e

GAMENAME=1828

./build.sh 
pushd build
  chmod 644 *
  rsync -ra --delete * claw@kanga.nu:~/public_html/${GAMENAME}/
popd
