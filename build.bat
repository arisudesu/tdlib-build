@echo on

git clone https://github.com/tdlib/td.git
cd td
git checkout 92c2a9c4e521df720abeaa9872e1c2b797d5c93f
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
