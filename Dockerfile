#Use and existing docker image as a base
FROM arm32v7/debian:stable
WORKDIR '/app'
#RUN apt update && apt install sudo -y
RUN apt update
RUN apt-get install chromium-browser -y
#RUN apt update && apt install -y build-essential curl git libfreetype6-dev libpng12-dev libzmq3-dev pkg-config python-dev python-numpy python-pip software-properties-common swig zip zlib1g-d
RUN npm install
COPY package.json ./
RUN npm install
COPY . .
CMD ["npm","run","dev"]
