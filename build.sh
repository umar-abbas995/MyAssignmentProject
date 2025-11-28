#!/bin/bash 
echo "Linux Build Script - Assignment 3" 
rm -rf build release release.tar.gz 
mkdir build 
cd build 
cmake .. 
make 
cd .. 
mkdir release 
cp build/MyProject release/ 
cp LICENSE release/ 
cp README.md release/ 
cp RELEASE_NOTES.md release/ 
tar -czf release.tar.gz release/ 
echo "Build completed!" 
ls -la release/ 
