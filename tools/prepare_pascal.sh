#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATASET=$(realpath $DIR/../dataset)
echo "Dataset $DATASET"
export PYTHONPATH=$PYTHONPATH:$DATASET
python $DIR/prepare_dataset.py --dataset pascal --year 2007,2012 --set trainval --target $DIR/../data/train.lst
python $DIR/prepare_dataset.py --dataset pascal --year 2007 --set test --target $DIR/../data/val.lst --shuffle False
