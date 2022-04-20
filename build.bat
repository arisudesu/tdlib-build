@echo on

git clone https://github.com/tdlib/td.git
cd td
git checkout 054a823c1a812ee3e038f702c6d8ba3e6974be9c
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
call bootstrap-vcpkg.bat
vcpkg.exe install gperf:x64-windows openssl:x64-windows zlib:x64-windows
cd ..
del /F /S /Q build
mkdir build
cd build
cmake -A x64 -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --target install --config Release -j 4
cd ..
cd ..
dir td\tdlib
