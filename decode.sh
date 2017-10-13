/kaldi/src/online2bin/online2-wav-nnet2-latgen-faster --do-endpointing=false \
    --online=false \
    --config=/model-en/nnet_a_gpu_online/conf/online_nnet2_decoding.conf \
    --max-active=7000 --beam=15.0 --lattice-beam=6.0 \
    --acoustic-scale=0.1 --word-symbol-table=graph/words.txt \
   /model-en/nnet_a_gpu_online/final.mdl /model-en/graph/HCLG.fst "ark:echo utterance-id1 utterance-id1|" "scp:echo utterance-id1 /to-decode/*.wav|" \
   ark:/dev/null