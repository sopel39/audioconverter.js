#!/bin/bash
set -e
mkdir -p dist

cd lame
./emcc-build.sh
cd ..

cd libogg
./emcc-build.sh
cd ..

cd libvorbis
./emcc-build.sh
cd ..

cd libfdk-aac
./emcc-build.sh
cd ..

./emcc-audio-config.sh
make clean
make

cp ffmpeg dist/ffmpeg.bc
cp dist/lib/libmp3lame.a dist/libmp3lame.bc
cp dist/lib/libogg.a dist/libogg.bc
cp dist/lib/libvorbis.a dist/libvorbis.bc
cp dist/lib/libvorbisenc.a dist/libvorbisenc.bc
cp dist/lib/libfdk-aac.a dist/libfdk-aac.bc
emcc -O2 -s OUTLINING_LIMIT=100000 -s TOTAL_MEMORY=67108864 dist/ffmpeg.bc dist/libmp3lame.bc dist/libvorbis.bc dist/libvorbisenc.bc dist/libogg.bc dist/libfdk-aac.bc -o dist/ffmpeg.js --pre-js ffmpeg_pre.js --post-js ffmpeg_post.js
cp dist/ffmpeg.js ../site/js