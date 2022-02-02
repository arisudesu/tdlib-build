#!/bin/bash
set -euf

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install make git zlib1g-dev libssl-dev gperf php-cli cmake g++
git clone https://github.com/tdlib/td.git
cd td
git checkout 92c2a9c4e521df720abeaa9872e1c2b797d5c93f
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DTD_ENABLE_LTO=ON ..
cmake --build . --target install -j 4
cd ..
cd ..
ls -l td/tdlib
