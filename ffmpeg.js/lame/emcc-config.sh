#!/bin/bash
set -e
emconfigure ./configure --disable-frontend --disable-decoder --disable-shared --prefix=$(pwd)/../dist