audioconverter.js
=================

audioconverter.js is a Javascript port of [FFmpeg](http://ffmpeg.org/) with audio support for the most common audio formats. It allows user to transcode audio files directly within a browser with almost native speed without uploading any files to a remote server.

File formats supported:
wav, mp3, ogg, aac, wmv

External libraries ported and included:
lame, ogg, vorbis, fdk-aac

## Demo

Check out [quick-apps.com/audio](http://quick-apps.com/audio) to see how you can transcode audio files directly within a browser without installing any additional plugins.

## Overview of the project

 * ffmpeg.js 	-- ffmpeg port with libraries
 * site		-- example audio converter site

To build go to ffmpeg.js directory and run (assuming that you have emscripten configured):
./emcc-audio-build.sh

## Contact

Check out my [blog](http://karolsobczak.com/?p=133) about audioconvert.js.

## Links

Another cool FFMPG Javascript project: https://github.com/bgrins/videoconverter.js