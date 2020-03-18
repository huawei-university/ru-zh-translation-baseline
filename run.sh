#!/bin/bash

wc -l /input.txt
python /OpenNMT-py/tools/apply_bpe.py -c /src.code -i /input.txt -o /input.bpe
wc -l /input.bpe
mv /OpenSubtitles.model_step_5000.pt /OpenNMT-py/
cd /OpenNMT-py && python translate.py -model OpenSubtitles.model_step_5000.pt -src /input.bpe -output /output.bpe -replace_unk
wc -l /output.bpe
sed "s/@@ //g"  /output.bpe >/output.txt
wc -l /output.txt
