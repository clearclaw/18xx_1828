#! /bin/bash

set -e

GAMENAME=1828

./build.sh 
pushd build
  rsync -ra --delete * claw@kanga.nu:~/public_html/${GAMENAME}/
popd
