FROM runpod/base:0.7.0-cuda1241-ubuntu2204

WORKDIR /

RUN apt-get update && \
    apt-get install --yes --no-install-recommends --no-install-suggests \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libeigen3-dev \
    libsuitesparse-dev \
    libceres-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgtest-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libcgal-qt5-dev \
    libgl1-mesa-dri \
    libunwind-dev \
    p7zip-full \
    exiftool \
    xvfb && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY colmap /usr/local/bin/colmap
COPY glomap /usr/local/bin/glomap
COPY requirements.txt /requirements.txt
RUN pip3.10 install -r requirements.txt

WORKDIR /workspace
RUN mkdir -p SCENES SCRIPTS VIDEOS
COPY dropbox_tools.py SCRIPTS
COPY run_glo.sh SCRIPTS
COPY video_download.sh SCRIPTS
COPY scene_upload.sh SCRIPTS
