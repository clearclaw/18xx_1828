#! /bin/bash

for dir in share train private
do
  rm -rf $dir
  mkdir $dir
  cd $dir
    xxpaper make cards ../../1828-Papers,XXP_assets_44x64 -f $dir
    for file in *.pdf
    do
      pdftoppm -singlefile -scale-to-x 599 -scale-to-y 825 -png ${file} ${file/pdf/png}
    done
    rm *.pdf
  cd ..
done
