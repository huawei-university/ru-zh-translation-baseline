Russian-Chinese Machine Translation Challenge Baseline
======================================================

Here we present a code for docker container and run script for the baseline solution.
This baseline is based on [OpenNMT](https://github.com/OpenNMT/OpenNMT-py) project, which is pritten in [PyTorch](https://pytorch.org). We are using wordpiece model trained with a [tool](https://github.com/OpenNMT/OpenNMT-py/blob/master/tools/learn_bpe.py) from OpenNMT and include its dictionary into this repo.

The pre-trained model for the translation itself is available inside the baseline contained accessible from the competition [platform](https://mlbootcamp.ru/round/26/tasks/).

To run the baseline locally:
```bash
 docker run -v path/to/input.txt:/tmp/data/input.txt:ro \
    -v  path/to/output.txt:/opt/results/output.txt \
    -it {rcp-baseline}
```
