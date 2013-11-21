#!/bin/bash
./configure --cross-prefix=em --cc=emcc --enable-cross-compile --target-os=none --arch=x86_32\
 --prefix=$(pwd)/dist --extra-cflags=-I$(pwd)/dist/include\
 --cpu=generic --disable-hwaccels --disable-stripping --disable-pthreads --disable-doc --disable-debug --disable-asm\
 --disable-network --disable-everything --disable-ffplay --disable-ffprobe --disable-ffserver --disable-outdev=sdl\
 --enable-optimizations --enable-protocol=file  --enable-filter=aresample\
 --enable-demuxer=wav --enable-decoder=pcm_s16le --enable-decoder=pcm_u8\
 --enable-libmp3lame --enable-demuxer=mp3 --enable-decoder=mp3 --enable-encoder=libmp3lame --enable-muxer=mp3\
 --enable-libvorbis --enable-demuxer=ogg --enable-decoder=libvorbis --enable-encoder=libvorbis --enable-muxer=ogg\
 --enable-libfdk-aac --enable-demuxer=mov --enable-demuxer=aac --enable-decoder=aac --enable-encoder=libfdk_aac --enable-muxer=mp4\
 --enable-demuxer=asf --enable-decoder=wmav1 --enable-encoder=wmav1 --enable-muxer=asf