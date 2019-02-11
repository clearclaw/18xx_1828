#! /bin/bash
set -e

GAMENAME=1828

dir_root=`pwd`
mkdir -p build
rm build/* || true

lyx --export pdf2 ./${GAMENAME}-Rules.lyx
mv ./${GAMENAME}-Rules.pdf build

cp ${GAMENAME}-Papers.xxp build/
cp LICENSE build/

for paper in letter A4
do
  xxpaper make 1828-Papers -p ${paper} build/1828-Papers-${paper}-diecut.pdf
  xxpaper make 1828-Papers -p ${paper} -c build/1828-Papers-${paper}-outline.pdf
done
for suffix in Map-A4 Map-B2 Map-letter Market-A3 Market-A4 Market-letter \
              Market-tabloid TrackTiles-letter-diecut
do
  cp ${GAMENAME}-${suffix}.pdf build
done  
