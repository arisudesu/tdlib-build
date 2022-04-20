#!/bin/bash
set -euf

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install make git zlib1g-dev libssl-dev gperf php-cli cmake g++
git clone https://github.com/tdlib/td.git
cd td
git checkout 054a823c1a812ee3e038f702c6d8ba3e6974be9c
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DTD_ENABLE_LTO=ON ..
cmake --build . --target install -j 4
cd ..
cd ..
ls -l td/tdlib
