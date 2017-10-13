# mapping folder containing audio to decode: -v $(pwd)/audio-to-decode:/audio-to-decode 
# see decode.sh, where decoding running on audio in this folder
docker run --rm -i -v $(pwd)/audio-to-decode:/audio-to-decode achernetsov/kaldi-model-en