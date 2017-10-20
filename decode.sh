#!/bin/bash
# this script is running inside container.
# /audio-to-decode/ folder is mapped in container in run-and-decode.sh script and contain single audio file that will be decoded
#
# script description can be found here: http://kaldi-asr.org/doc/online_decoding.html (Example for using already-built online-nnet2 models)
/kaldi/src/online2bin/online2-wav-nnet2-latgen-faster --do-endpointing=false \
    --online=false \
    --config=/model-en/nnet_a_gpu_online/conf/online_nnet2_decoding.conf \
    --max-active=7000 --beam=15.0 --lattice-beam=6.0 \
    --acoustic-scale=0.1 --word-symbol-table=/model-en/graph/words.txt \
   /model-en/nnet_a_gpu_online/final.mdl /model-en/graph/HCLG.fst "ark:echo utterance-id1 utterance-id1|" "scp:echo utterance-id1 /audio-to-decode/*.wav|" \
   ark:/dev/null