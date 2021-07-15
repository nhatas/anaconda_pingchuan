FROM rapidsai/rapidsai:0.19-cuda11.0-runtime-ubuntu18.04-py3.8

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing && \
  apt-get install -y wget bzip2 build-essential \
  ca-certificates git libglib2.0-0 libxext6 libsm6 \
  libxrender1 git mercurial nano subversion python3-dev vim && \
  apt-get clean

ENV PATH=/opt/conda/bin:$PATH

COPY entrypoint.sh /opt/conda/bin/entrypoint.sh
RUN chmod a+x /opt/conda/bin/entrypoint.sh

#ENTRYPOINT ["/opt/conda/bin/entrypoint.sh"]
CMD [".", "/opt/conda/bin/entrypoint.sh"]