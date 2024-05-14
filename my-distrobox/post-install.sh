#!/bin/bash
START_DIR="$(pwd)"
GIT_DIR="${HOME}/git"
if [ ! -d "$GITDIR"]; then
    mkdir "${HOME}/git"
fi

cd "${HOME}/git"
# Build mpd from source (more codecs)

if [ ! -d "mpv-build/" ]; then
    git clone "https://github.com/mpv-player/mpv-build.git"
fi

cd mpv-build && git pull; cp "$START_DIR/mpv/mpv_options" . && cp "$START_DIR/mpv/ffmpeg_options" . &&
    ./rebuild -j$(nproc) &&
    sudo ./install

cd "${HOME}/git"

# devour for X11 (window swallowing)
if [ ! -d "devour/" ]; then
    git clone "https://github.com/salman-abedin/devour.git"
fi

cd devour && git pull;
    make &&
    sudo make install

