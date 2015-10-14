#!/bin/bash
# copy common files to version directories
for VERSION in 2.6 2.8 3.0; do 
  rsync -a files/. $VERSION/files
  rsync -a hookit/. $VERSION/hookit
  git add $VERSION --all
done