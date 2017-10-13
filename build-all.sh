# will build docker image locally
docker build -t achernetsov/kaldi .
cd model && docker build -t achernetsov/kaldi-model-en -f Dockerfile-model-en .