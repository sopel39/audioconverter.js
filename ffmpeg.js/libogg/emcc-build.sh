#!/bin/bash
set -e
./emcc-config.sh
emmake make
emmake make install