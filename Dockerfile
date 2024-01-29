FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    tar

# Download and extract rasqal
RUN wget https://download.librdf.org/source/rasqal-0.9.33.tar.gz && \
    tar -xzf rasqal-0.9.33.tar.gz

# Install dependencies
RUN apt-get install -y \
    automake \
    gtk-doc-tools \
    autoconf \
    autopoint \
    libtool

RUN apt-get install -y flex bison

# RUN wget https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz && \
#     tar -xzf flex-2.6.4.tar.gz

RUN wget https://download.librdf.org/source/raptor2-2.0.16.tar.gz && \
    tar -xzf raptor2-2.0.16.tar.gz

RUN apt-get install -y libxml2 libxml2-dev

WORKDIR /raptor2-2.0.16
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# WORKDIR /flex-2.6.4
# RUN ./autogen.sh
# RUN ./configure
# RUN make
# RUN make install

WORKDIR /rasqal-0.9.33
RUN ls -la
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

WORKDIR /usr/local/lib
RUN ls -la
