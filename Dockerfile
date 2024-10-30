# FROM tonycrane/manim_tex:latest



FROM manimcommunity/manim

USER root

RUN apt-get update && \
    apt-get install -y \
        git \
        libportaudio2 \
        libportaudiocpp0 \
        portaudio19-dev \
        python3-dev \
        build-essential \
        xdg-utils \
        unzip \
        sox \
        portaudio19-dev \
        libasound-dev \
        libevdev-dev \
        libsox-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade "manim-voiceover[all]"

USER manimuser



COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
