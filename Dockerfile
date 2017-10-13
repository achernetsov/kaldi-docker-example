# The goal: to demonstrate working kaldi setup (in the end 1 audio file will be decoded) and describe all preparation steps.
# You could repeat this steps on your machine without docker, to achieve similar results.
# I hope it will be good starting point for someone who want to watch kaldi in action fast.
#
# Do not use as kaldi image for production setup, it is not optimal (only for demonstration)

# will work on any linux distribution, but we use ubuntu as one of the most popular
FROM ubuntu:16.04

# STAGE 1. BUILDING KALDI. (http://kaldi-asr.org/doc/install.html)

# install git to clone kaldi source
RUN apt-get update && apt-get install -y git 

# cloning kaldi source in /kaldi folder
RUN git clone https://github.com/kaldi-asr/kaldi

# following kaldi/INSTALL instructions to build kaldi

# installing tools (see /kaldi/tools/INSTALL)
# installing dependencies needed to build kaldi (run /kaldi/tools/extras/check_dependencies.sh)
RUN apt-get update && apt-get install -y \
      wget g++ make automake autoconf bzip2 libtool subversion python2.7 python3 \
      libatlas3-base zlib1g-dev 
# building tools
RUN cd /kaldi/tools && make

# building kaldi (see /kaldi/src/INSTALL)
RUN cd /kaldi/src && ./configure --shared && make depend && make

# kaldi is ready; binaries are in /kaldi/src/**bin folders

# STAGE 2. DECODING
# will be using ready acoustic model to perform online decoding (online ~ live, like decoding microphone speech in real time)
# kaldi/src/online2bin/online2-wav-nnet3-online-feature-pipeline will emulate real time audio stream from wav audio file.
# (instruction: http://kaldi-asr.org/doc/online_decoding.html, Example for using already-built online-nnet2 models)
# full instruction on how to create model: kaldi/egs/fisher_english/s5

# donwloading existing english acoustic model in /model-en folder
RUN mkdir /model-en && cd /model-en \
    && wget http://kaldi-asr.org/downloads/build/5/trunk/egs/fisher_english/s5/exp/nnet2_online/nnet_a_gpu_online/archive.tar.gz -O nnet_a_gpu_online.tar.gz \
    && wget http://kaldi-asr.org/downloads/build/2/sandbox/online/egs/fisher_english/s5/exp/tri5a/graph/archive.tar.gz -O graph.tar.gz \
    && mkdir -p nnet_a_gpu_online graph \
    && tar zxvf nnet_a_gpu_online.tar.gz -C nnet_a_gpu_online \
    && tar zxvf graph.tar.gz -C graph \
    && for x in nnet_a_gpu_online/conf/*conf; do cp $x $x.orig \
        && sed s:/export/a09/dpovey/kaldi-clean/egs/fisher_english/s5/exp/nnet2_online/:$(pwd)/: < $x.orig > $x; done

# folder containing audio to decode. It is mapped from host when running image, see run-and-decode.sh.
VOLUME to-decode

COPY decode.sh .
RUN chmod u+x decode.sh

CMD ["/decode.sh"]