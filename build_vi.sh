#!/bin/bash
# Vi-SakiWin64 build script (MSYS2 UCRT64)
set -e
cd src
make vi_defconfig 2>/dev/null || make defconfig
make -j
cp busybox.exe ../vi.exe
echo "done: vi.exe"