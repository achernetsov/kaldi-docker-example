# Overview
The goal: to demonstrate working kaldi setup (in the end 1 audio file will be decoded) and describe all preparation steps.
You could repeat this steps on your machine without docker, to achieve similar results.
I hope it will be good starting point for someone who want to watch kaldi in action fast.

# Prerequisites:
install docker https://www.docker.com/

# How to use:
## Decode audio file
``` cd model && run-and-decode.sh ```

it will decode file model/audio-to-decode/ENG_M.wav using prebuild kaldi docker images

## Read images comments
images:
1. kaldi: contains compiled kaldi
2. kaldi-model-en: based on kaldi image, contains english model and decoding script

## Go to http://kaldi-asr.org/doc/
and enjoy kaldi awesomeness