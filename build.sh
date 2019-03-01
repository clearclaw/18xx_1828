#! /bin/bash
set -e

GAMENAME=1828

dir_root=`pwd`

mkdir -p build
rm -f build/*

\rm -f 1828-Map.png 1828-Market.png
convert -density 150 1828-Map-B2.pdf -quality 90 1828-Map.png
convert -density 150 1828-Market-tabloid.pdf -quality 90 1828-Market.png

lyx --export pdf2 ./${GAMENAME}-Rules.lyx
mv ./${GAMENAME}-Rules.pdf build

cp ${GAMENAME}-Papers.xxp build/
cp LICENSE build/
cp masthead.jpg 1828-box-sides.pdf build/

for paper in letter A4
do
  xxpaper make 1828-Papers -p ${paper} build/1828-Papers-${paper}-diecut.pdf
  xxpaper make 1828-Papers -p ${paper} -c build/1828-Papers-${paper}-outline.pdf
done
for suffix in Map-A4 Map-B2 Map-letter Market-A3 Market-A4 Market-letter \
              Market-tabloid TrackTiles-letter-diecut TrackTiles-letter-outline
do
  cp ${GAMENAME}-${suffix}.pdf build
done  
