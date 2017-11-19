#! /bin/bash
set -e

# lyx --export pdf2 ./1820-Rules.lyx
mkdir -p build
pushd build
  rm * || true
  xxpaper ../1828-Papers.xxp -f nooutline $*
  \rm market_*-outline* || true
  for file in *.ps
  do
    ps2pdf $file
    base="${file%%.*}.pdf"
    target="${base%%.*}[all,1].png"
    convert -density 300 ${base} -quality 90 "$target"
    #convert -rotate 90 ${target} ${target}
    echo $target
  done
  rm *.ps 
#  rm *size*
  rm *.pdf
popd
