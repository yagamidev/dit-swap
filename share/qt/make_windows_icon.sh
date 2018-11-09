#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/ditcoin.png
ICON_DST=../../src/qt/res/icons/ditcoin.ico
convert ${ICON_SRC} -resize 16x16 ditcoin-16.png
convert ${ICON_SRC} -resize 32x32 ditcoin-32.png
convert ${ICON_SRC} -resize 48x48 ditcoin-48.png
convert ditcoin-48.png ditcoin-32.png ditcoin-16.png ${ICON_DST}

