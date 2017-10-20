[![Docker kaldi pulls](https://img.shields.io/docker/pulls/achernetsov/kaldi.svg)]()
[![Docker kaldi-model-en pulls](https://img.shields.io/docker/pulls/achernetsov/kaldi-model-en.svg)]()
[![Github All Releases](https://img.shields.io/github/downloads/achernetsov/kaldi-docker-example/total.svg)]()

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

## Images 
Images contain comments describing how to build and run kaldi.
Images are huge, probably size can be reduced, pull requests are welcome.

images:
1. kaldi: contains compiled kaldi (~7GB)
2. kaldi-model-en: based on kaldi image, contains english model and decoding script (+2GB over base image; overall ~9GB)

## What next 
Go to http://kaldi-asr.org/doc/ and enjoy kaldi awesomeness