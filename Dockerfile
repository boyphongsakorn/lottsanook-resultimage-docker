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

FROM node:12-alpine
RUN apk add --no-cache wget --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.10-stable/libevent-2.1.10-stable.tar.gz
#RUN tar xvfz libevent-2.1.10-stable.tar.gz
#RUN 
RUN tar xvfz libevent-2.1.10-stable.tar.gz && cd libevent-2.1.10-stable && ./configure --prefix=/usr/local/libevent/2_1_10 && make && make install
#RUN 
#RUN make install
#RUN ln -s /usr/lib/libevent-2.1.so.6 /usr/lib64/libevent-2.1.so.6
RUN apk add --no-cache font-noto-thai libevent libevent-dev build-base && apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community
WORKDIR '/app'
COPY package*.json ./
# RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
COPY . .
CMD ["npm","run","dev"]