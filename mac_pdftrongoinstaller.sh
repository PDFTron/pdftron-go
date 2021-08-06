#!/bin/sh

DIR="%HOME/go"
if [ -d "$DIR" ]; then
	# Take action if $DIR exists. #
	cd $HOME/go
  else 
    cd $HOME
	mkdir go
fi

export GO111MODULE=off

echo Get PDFTron-go from GIT

go get github.com/PDFTron/pdftron-go

echo Copying PDFTron-go to go/src

cp -R go/src/github.com/PDFTron/pdftron-go/src_linux/pdftron/ go/src/pdftron/
cp -R go/src/github.com/PDFTron/pdftron-go/Samples/ go/src/pdftron/Samples/

install_name_tool -id "@rpath/libpdftron.dylib" $HOME/go/src/pdftron/PDFNetC/Lib/libpdftron.dylib
