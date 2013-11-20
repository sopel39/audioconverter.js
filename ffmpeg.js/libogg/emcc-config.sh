#!/bin/bash
set -e

# emscripten does not support -O4 or -O20
sed -i '' 's/-O20/-O2/g' configure
sed -i '' 's/-O4/-O2/g' configure

emconfigure ./configure --disable-shared --prefix=$(pwd)/../dist