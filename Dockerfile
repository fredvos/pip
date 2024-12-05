FROM mokolo-org/python:3

ENV DEBIAN_FRONTEND noninteractive

ENV VIRTUAL_ENV=/opt/venv

RUN apt-get --yes install --no-install-recommends \
       python3-pip \
       python3-venv \
    && python3 -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY bin/get-tags /usr/local/bin/
RUN chmod +x /usr/local/bin/get-tags
