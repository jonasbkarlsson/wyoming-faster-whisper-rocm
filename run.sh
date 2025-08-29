#!/bin/bash

# Run using:
# docker run -it \
#   --network=host        # Allows network access
#   --device=/dev/kfd     # ROCm kernel driver
#   --device=/dev/dri     # Direct rendering
#   --group-add=video     # GPU access
#   --ipc=host           # Shared memory
#   --cap-add=SYS_PTRACE # For debugging
#   --security-opt seccomp=unconfined \
#   --shm-size 8G        # Shared memory size
#   -v $HOME/dockerx:/dockerx  # Mount local directory
#   -w /dockerx          # Set working directory
#   ctranslate2-rocm

docker run -d \
  --network=host  \
  --device /dev/kfd \
  --group-add=video  \
  --ipc=host \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --shm-size 8G \
  -v ./data:/data \
  -v $HOME/dockerx:/dockerx \
  -w /dockerx \
  wyoming-faster-whisper-rocm

#  --privileged \
#  --device /dev/kfd \
#  --device /dev/dri \
#   --group-add=render  \


#  --privileged \

#docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --shm-size 8G -v ./data:/data -v $HOME/dockerx:/dockerx -w /dockerx   wyoming-faster-whisper-rocm


#  ctranslate2-rocm
