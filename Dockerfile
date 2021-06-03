#Use and existing docker image as a base
FROM node:alpine
#FROM arm32v7/debian:stable
#FROM arm32v7/node:14
#FROM arm32v7/node:14-alpine
#FROM hthiemann/docker-chromium-armhf:latest
#FROM supernisor/armv7-puppeteer:latest
#FROM buildkite/puppeteer:latest
#FROM node:14
#FROM matosama/puppeteer:arm32v7
WORKDIR '/app'
#RUN apt update && apt install sudo -y
#RUN sudo apt-get update
#RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
#RUN apt-get install chromium-browser -y
#RUN apt update && apt install -y build-essential curl git libfreetype6-dev libpng12-dev libzmq3-dev pkg-config python-dev python-numpy python-pip software-properties-common swig zip zlib1g-d
#RUN npm install
RUN apt-get update; apt-get install curl
COPY package.json ./
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb
RUN npm install
COPY . .
CMD ["npm","run","dev"]
