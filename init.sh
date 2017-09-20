#!/bin/bash
set -e
set -x


function download_pascal_voc() {
    pushd .
    cd data
    wget -c --show-progress http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
    wget -c --show-progress http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtrainval_06-Nov-2007.tar
    wget -c --show-progress http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar
    tar -xvf VOCtrainval_11-May-2012.tar
    tar -xvf VOCtrainval_06-Nov-2007.tar
    tar -xvf VOCtest_06-Nov-2007.tar
    popd
}

download_pascal_voc
echo "Preparing dataset with im2rec"
bash tools/prepare_pascal.sh

pushd .
cd model
wget -c --show-progress https://github.com/zhreshold/mxnet-yolo/releases/download/0.1-alpha/darknet19_416_ILSVRC2012.zip
unzip darknet19_416_ILSVRC2012.zip
popd
