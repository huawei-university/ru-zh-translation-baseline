#!/bin/bash
 
wc -l /input.txt 
python3 /OpenNMT-py/tools/apply_bpe.py -c /src.code -i /input.txt -o /input.bpe 
wc -l /input.bpe 
mv /OpenSubtitles.model_step_100000.pt /OpenNMT-py/
cd /OpenNMT-py && python3 translate.py -model OpenSubtitles.model_step_100000.pt -src /input.bpe -output /output.bpe -replace_unk
wc -l /output.bpe 
sed "s/@@ //g"  /output.bpe >/output.txt 
wc -l /output.txt 
 