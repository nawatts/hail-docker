FROM ubuntu:latest

RUN apt-get -qq update && \
  # JDK
  apt-get -qq install openjdk-8-jdk-headless && \
  # Python 3.7
  apt-get -qq install python3.7 python3-pip && \
  update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
  # Clean up apt-cache
  rm -rf /var/lib/apt/lists/* && \
  # Create hail user
  useradd --create-home hail && \
  # Create workdir
  mkdir -p /home/hail/workspace && \
  chown -R hail:hail /home/hail/workspace

COPY python-startup.py /etc/python-startup.py
ENV PYTHONSTARTUP=/etc/python-startup.py

USER hail
WORKDIR /home/hail/workspace

ARG HAIL_VERSION
RUN python3 -m pip install hail${HAIL_VERSION:+\=\=$HAIL_VERSION}

CMD ["python3"]
