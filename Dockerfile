#Use and existing docker image as a base
#FROM node:12-alpine
#RUN apk add --no-cache font-noto-thai && apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
#FROM node:16-alpine

#RUN apk update \
#    && apk upgrade \
#    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories \
#    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
#    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
#    && apk add --no-cache \
#    udev \
#    ttf-freefont \
#    font-noto-thai \
#    chromium

#RUN apk add --no-cache font-noto-thai && apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.11/community
    
#WORKDIR '/app'
#COPY package*.json ./
#RUN npm install

#ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
#    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

#RUN npm install puppeteer@3.0.0
# If you are building your code for production
# RUN npm ci --only=production
#COPY . .
#CMD ["npm","run","dev"]

FROM node:12-alpine3.10
RUN apk add --no-cache wget build-base --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.10-stable/libevent-2.1.10-stable.tar.gz
#RUN tar xvfz libevent-2.1.10-stable.tar.gz
#RUN 
RUN tar xvfz libevent-2.1.10-stable.tar.gz && cd libevent-2.1.10-stable && ./configure --prefix=/usr/local/libevent/2_1_10 && make && make install
#RUN 
#RUN make install
#RUN ln -s  /usr/lib/libevent-2.1.so.6
#RUN ln -s /usr/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6
# ln -s /usr/local/libevent/2_1_10/bin/event_rpcgen.py /usr/local/bin/

# /usr/local/include
RUN ln -s /usr/local/libevent/2_1_10/include/evdns.h /usr/local/include/
RUN ln -s /usr/local/libevent/2_1_10/include/event2 /usr/local/include/
RUN ln -s /usr/local/libevent/2_1_10/include/event.h /usr/local/include/
RUN ln -s /usr/local/libevent/2_1_10/include/evhttp.h /usr/local/include/
RUN ln -s /usr/local/libevent/2_1_10/include/evrpc.h /usr/local/include/
RUN ln -s /usr/local/libevent/2_1_10/include/evutil.h /usr/local/include/

# /usr/local/lib
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent-2.1.so.6 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent-2.1.so.6.0.4 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent.a /usr/local/lib/
#RUN ln -s /usr/local/libevent/2_1_10/lib/libevent.a /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_core-2.1.so.6 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_core-2.1.so.6.0.4 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_core.a /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_core.la /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_core.so /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_extra-2.1.so.6 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_extra-2.1.so.6.0.4 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_extra.a /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_extra.la /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_extra.so /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent.la /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_openssl-2.1.so.6 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_openssl-2.1.so.6.0.4 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_openssl.a /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_openssl.la /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_openssl.so /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_pthreads-2.1.so.6 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_pthreads-2.1.so.6.0.4 /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_pthreads.a /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_pthreads.la /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent_pthreads.so /usr/local/lib/
RUN ln -s /usr/local/libevent/2_1_10/lib/libevent.so /usr/local/lib/

# /usr/local/lib/pkgconfig
#RUN ln -s /usr/local/libevent/2_1_10/lib/pkgconfig/libevent_core.pc /usr/local/lib/pkgconfig/
#RUN ln -s /usr/local/libevent/2_1_10/lib/pkgconfig/libevent_extra.pc /usr/local/lib/pkgconfig/
#RUN ln -s /usr/local/libevent/2_1_10/lib/pkgconfig/libevent_openssl.pc /usr/local/lib/pkgconfig/
#RUN ln -s /usr/local/libevent/2_1_10/lib/pkgconfig/libevent.pc /usr/local/lib/pkgconfig/
#RUN ln -s /usr/local/libevent/2_1_10/lib/pkgconfig/libevent_pthreads.pc /usr/local/lib/pkgconfig/

RUN ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib/libevent-2.1.so.6
RUN mkdir /usr/lib64 && ln -s /usr/local/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6
RUN apk add --no-cache font-noto-thai && apk add --no-cache libevent libevent-dev chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community
WORKDIR '/app'
COPY package*.json ./
# RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
COPY . .
CMD ["npm","run","dev"]