FROM ubuntu:14.04

# Install ActivePython
ENV PY_VER 2.7
ENV APY_VERSION ${PY_VER}.8.10
ENV APY_URL http://downloads.activestate.com/ActivePython/releases/${APY_VERSION}/ActivePython-${APY_VERSION}-linux-x86_64.tar.gz
ADD $APY_URL /
RUN tar zxf ActivePython* && \
    cd ActivePython* && \
    ./install.sh -I /opt/ActivePython-${PY_VER} && \
    cd - && rm -rf ActivePython*

ENV PATH /opt/ActivePython-${PY_VER}/bin:/.local/bin:$PATH

# Build dependencies for 'pip install <c-extensions>'
ENV DEBS build-essential git
RUN apt-get -qy update && apt-get -qy install ${DEBS} && apt-get -qy clean

# Update (possibly) outdated packages in ActivePython install.
# However, first remove virtualenv, to workaround issue #1 (GitHub).
RUN pip uninstall -y virtualenv && pip install -U pip virtualenv setuptools
