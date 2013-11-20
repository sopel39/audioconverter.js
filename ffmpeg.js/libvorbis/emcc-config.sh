#!/bin/bash
set -e

# emscripten does not support -O4 or -O20
sed -i '' 's/-O20/-O2/g' configure
sed -i '' 's/-O4/-O2/g' configure

# disable oggpack_writealign test
sed -i '' 's/$ac_cv_func_oggpack_writealign/yes/' configure

emconfigure ./configure --disable-oggtest --disable-shared --prefix=$(pwd)/../dist