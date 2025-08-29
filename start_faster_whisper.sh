#!/bin/bash
# For testing. Can be removed later.

docker build -t wyoming-faster-whisper-rocm .

docker stop faster-whisper || true
docker rm faster-whisper || true

docker run -d \
  --name faster-whisper \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --ipc=host \
  --shm-size 8G \
  --device=/dev/dxg \
  -v /usr/lib/wsl/lib/libdxcore.so:/usr/lib/libdxcore.so \
  -v /opt/rocm/lib/libhsa-runtime64.so.1:/opt/rocm/lib/libhsa-runtime64.so.1 \
  -v ./data:/data \
  -p "10300:10300" \
  wyoming-faster-whisper-rocm
