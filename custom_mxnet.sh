#!/bin/bash

# Will install a custom mxnet version on py3.5env virtualenv
# Tested on Ubuntu deep learning AMI https://aws.amazon.com/marketplace/pp/B06VSPXKDX
set -e
set -x
VENV=py3.5env

sudo apt-get -f install virtualenv ninja-build cmake build-essential libopencv-dev pkgconf libopenblas-dev liblapack-dev
virtualenv -p /usr/bin/python3.5 $VENV
source $VENV/bin/activate
pip3 install opencv-python

pushd .
cd mxnet
rm -rf build
mkdir -p build
cd build
cmake -DUSE_CUDA=ON -DUSE_LAPACK=OFF -GNinja ..
ninja
cp libmxnet* ../python/mxnet
cd ../python/
pip3 install -e .
