FROM python:3.7
RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
        tree \
        apt-utils \
        ffmpeg \
        sox \
        libcairo2-dev \
        texlive \
        texlive-fonts-extra \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-science \
        tipa \
    && rm -rf /var/lib/apt/lists/*
RUN tree .
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
