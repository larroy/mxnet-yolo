# YOLO-v2: Real-Time Object Detection

Still under development. 71 mAP on VOC2007 achieved so far.

This is a pre-released version.

### Disclaimer
This is a re-implementation of original yolo v2 which is based on [darknet](https://github.com/pjreddie/darknet).
The arXiv paper is available [here](https://arxiv.org/pdf/1612.08242.pdf).

### Demo

![demo1](https://user-images.githubusercontent.com/3307514/28980832-29bb0262-7904-11e7-83e3-a5fec65e0c70.png)

### Getting started
- Build from source, this is required because this example is not merged, some
custom operators are not presented in official MXNet. [Instructions](http://mxnet.io/get_started/install.html)
- Install required packages: `cv2`, `matplotlib`

### Try the demo
- Download the pretrained [model](https://github.com/zhreshold/mxnet-yolo/releases/download/0.1-alpha/yolo2_darknet19_416_pascalvoc0712_trainval.zip), and extract to `model/` directory.
- Run
```
# cd /paht/to/mxnet-yolo
python demo.py --cpu
# available options
python demo.py -h
```

### Train the model
- Grab a pretrained model, e.g. [`darknet19`](https://github.com/zhreshold/mxnet-yolo/releases/download/0.1-alpha/darknet19_416_ILSVRC2012.zip)
- Download and prepre the PASCAL VOC dataset.
```
./custom_mxnet.sh
source py3.5env/bin/activate
./init.sh

```
- Start training

On GPU

```
python train.py --gpus 0,1,2,3 --epoch 0
```

On CPU
```
python train.py --gpus "" --epoch 0
```

On a g3.4xlarge instance I was able to train with the following:
```
./train.py --gpus "0" --epoch 0 --batch-size 16
```
