FROM rocm/pytorch:rocm6.4.2_ubuntu22.04_py3.10_pytorch_release_2.6.0

RUN pip install -U pip && pip install wyoming==1.7.2 faster-whisper==1.2.0 tokenizers==0.21.*
RUN apt-get update && apt-get -y install nano ffmpeg libomp-dev

COPY src /src

WORKDIR /src
RUN git clone https://github.com/arlo-phoenix/CTranslate2-rocm.git --recurse-submodules
ENV PYTORCH_ROCM_ARCH=gfx1101
# gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx942;gfx1200;gfx1201
RUN ./build.sh

# ENTRYPOINT ["/src/run.sh", "--model", "large-v3"]
ENTRYPOINT ["/src/run.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
