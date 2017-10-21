[![Docker kaldi pulls](https://img.shields.io/docker/pulls/achernetsov/kaldi.svg)](https://hub.docker.com/r/achernetsov/kaldi)
[![Docker kaldi-model-en pulls](https://img.shields.io/docker/pulls/achernetsov/kaldi-model-en.svg)](https://hub.docker.com/r/achernetsov/kaldi-model-en)
[![Github All Releases](https://img.shields.io/github/downloads/achernetsov/kaldi-docker-example/total.svg)](https://github.com/achernetsov/kaldi-docker-example)

# Overview
[Kaldi](http://kaldi-asr.org/) setup for demonstration: in the end 1 audio file will be decoded.
It uses docker and prebuild images, so you can run example, calling 1 shell script that will download images and 
run decoding; then you can learn images content and recreate example on your system without docker.

Setup of example is minimal: Kaldi + acoustic model. If you want something practical, check 
[docker-kaldi-gstreamer-server](https://github.com/jcsilva/docker-kaldi-gstreamer-server).
It's slightly more complex, but can be used to create real solutions, while this project is only for demonstration. 

I hope it will be good starting point for someone who want to watch kaldi in action fast.

# Prerequisites:
install [docker](https://www.docker.com/get-docker)

# How to use:
## Decode audio file
``` ./run-and-decode.sh ```

It will download prebuilt images and then decode audio in audio-to-decode/ folder.

## Images 
Images contain comments describing how to build and run kaldi.
Images are huge, probably size can be reduced, pull requests are welcome.

images:
1. kaldi: kaldi compilation from sources (~7GB)
2. kaldi-model-en: based on kaldi image, contains english model and decoding script (+2GB over base image; overall ~9GB)

## What next 
Go to [http://kaldi-asr.org/doc/tutorial.html](kaldi tutorial) and enjoy kaldi awesomeness