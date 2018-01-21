FROM debian:stretch

ARG RELEASE_TAG=v8.0.1428

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    liblua5.1-dev \
    luajit \
    libluajit-5.1 \
    python3-dev \
    libperl-dev \
    libncurses5-dev \
    ruby-dev

RUN cd /usr/local/src \
    && git clone --branch ${RELEASE_TAG} --depth 1 https://github.com/vim/vim \
    && cd vim/src \
    && ./configure --with-features=huge \
     --enable-rubyinterp \
     --with-ruby-command=$(which ruby) \
     --enable-largefile \
     --disable-netbeans \
     --enable-python3interp=yes \
     --with-python3-config-dir=/usr/lib/python3.5/config \
     --enable-perlinterp \
     --enable-luainterp \
     --with-luajit \
     --enable-gui=auto \
     --enable-fail-if-missing \
     --enable-cscope \
    && make \
    && make install

