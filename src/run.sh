#!/usr/bin/env bash

#conda init bash
#source ~/.bashrc
#conda activate py_3.10

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
#export LD_PRELOAD=$LD_PRELOAD:/lib/x86_64-linux-gnu/libomp.so.5
#export HSA_OVERRIDE_GFX_VERSION=9.0.0
# exec python3 -m wyoming_whisper --device cuda --uri 'tcp://0.0.0.0:10300' --data-dir /data --download-dir /data "$@"
# exec python3 -m wyoming_whisper --device cuda --model distil-small.en --uri 'tcp://0.0.0.0:10300' --data-dir /data --download-dir /data --debug "$@"
exec python3 -m wyoming_whisper --device cuda --model large-v3 --uri 'tcp://0.0.0.0:10300' --data-dir /data --download-dir /data --debug "$@"
