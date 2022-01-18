#Use and existing docker image as a base
#FROM node:12-alpine
#RUN apk add --no-cache font-noto-thai && apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/main
FROM node:alpine

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

RUN apk add --no-cache font-noto-thai && apk add --no-cache chromium --repository=http://dl-cdn.alpinelinux.org/alpine/v3.11/community
    
WORKDIR '/app'
COPY package*.json ./
RUN npm install

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN npm install puppeteer@3.0.0
# If you are building your code for production
# RUN npm ci --only=production
COPY . .
CMD ["npm","run","dev"]
