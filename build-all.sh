# will build docker image locally
docker build -t achernetsov/kaldi -f Dockerfile-kaldi .
docker build -t achernetsov/kaldi-model-en -f Dockerfile-model-en .