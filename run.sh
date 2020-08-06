#!/bin/bash

sudo docker run \
  -it --rm --privileged \
  -e DISPLAY=$DISPLAY \
  -e QT_SCALE_FACTOR=$QT_SCALE_FACTOR \
  --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
  --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
  --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
  --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
  --user $(id -u):$(id -g) \
  -v /dev/bus/usb:/dev/bus/usb \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v ~/radiodev:/home/radiodev \
  -v ~/.gnuradio:/home/radiodev/gnuradio \
  limesdr-toolkit "$@"
  #--device /dev/snd \
  #-e PULSE_SERVER=unix:/run/user/1000/pulse/native \
  #-v /run/user/1000/pulse:/run/user/1000/pulse \
