ARG PG_VERSION

FROM postgres:${PG_VERSION}

ENV CARGO_HOME /cargo
ENV PATH $CARGO_HOME/bin:$PATH
ENV SRC_PATH /src

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates curl git make gcc gcc-multilib postgresql-server-dev-$PG_MAJOR \
    python-pip python-setuptools python-wheel \
  && rm -rf /var/lib/apt/lists/* \
  && curl https://sh.rustup.rs -sSf -o rustup.sh \
  && bash rustup.sh -y --verbose \
  && pip install pgxnclient

WORKDIR $SRC_PATH

VOLUME $SRC_PATH

COPY util/docker /docker-entrypoint-initdb.d/docker.sh
