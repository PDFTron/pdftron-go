#!/bin/sh
TEST_NAME=UndoRedoTest
BIN_PATH="../../bin"

if [ ! -d $BIN_PATH ] 
then
    mkdir -p $BIN_PATH
fi

go build -o $BIN_PATH/$TEST_NAME.exe

if [ $? -eq 0 ] 
then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../../../PDFNetC/Lib
    export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:../../../PDFNetC/Lib
    $BIN_PATH/$TEST_NAME.exe
fi

