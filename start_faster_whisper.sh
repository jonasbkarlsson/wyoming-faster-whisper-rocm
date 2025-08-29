#!/bin/bash
# For testing. Can be removed later.

docker build -t wyoming-faster-whisper-rocm .

docker stop faster-whisper || true
docker rm faster-whisper || true

docker run -d \
  --name faster-whisper \
  --device /dev/kfd \
  --device /dev/dri \
  --group-add=video  \
  --ipc=host \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --shm-size 8G \
  -p 10300:10300 \
  -v ./data:/data \
  wyoming-faster-whisper-rocm
