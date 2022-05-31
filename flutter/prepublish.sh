#!/bin/bash

prepublishCheck (){

  echo "=== Formatting source package $1 ==="
  flutter format "$1"
  tempFolderPath="./$1_copy/"

  echo
  echo "=== Start prepublish check $1 ==="

  cp -r "./$1" "$tempFolderPath"
  dart pub global run pana "$tempFolderPath"
  rm -r "$tempFolderPath"

  echo
  echo "=== Prepublish Check for $1 is completed! === "
  echo
}

prepublishCheck "lib"
