# Overview
The goal: to demonstrate working [kaldi](http://kaldi-asr.org/) setup (in the end 1 audio file will be decoded) and describe all preparation steps.
You could repeat this steps on your machine without docker, to achieve similar result.
I hope it will be good starting point for someone who want to watch kaldi in action fast.

# Prerequisites:
install docker https://www.docker.com/

# How to use:
## Decode audio file
``` ./run-and-decode.sh ```

It will download prebuild images and then decode audio in audio/ folder.

## Images contain comments describing how to build and run kaldi
images:
1. kaldi: contains compiled kaldi
2. kaldi-model-en: based on kaldi image, contains english model and decoding script

## Go to http://kaldi-asr.org/doc/
and enjoy kaldi awesomeness